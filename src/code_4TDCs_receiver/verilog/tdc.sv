
`default_nettype wire

module tdc #(
    // parameter CMPTDCFIFO_WIDTH = 8,
    parameter CMPTDCFIFO_WIDTH = 32,
    parameter CMPTDCFIFO_DEPTH = 4096,
    parameter CNT_WIDTH     = 32, // do not change this
    parameter N_STAGES      = 5,
    parameter TRNGCFG_WIDTH = 5,
    parameter TRNG_WIDTH    = 256,
    parameter MEASUREMENTS_PER_CYCLES = 128 
) (
    input                         clk,
    input                         rst,//active high
    input                         start_trigger,
    input                         reset_axi,
    input  [31:0]                 measurement_num,
    input  [31:0]                 tdc_config,
    output [CNT_WIDTH-1:0]        status,

    input  [31:0]                 local_stressor_count_cycles,

    input                         compressedTDC_fifo_rd_en,
    output wire                   compressedTDC_fifo_empty,
    output [CMPTDCFIFO_WIDTH-1:0] compressedTDC_fifo_rd_data,
    output wire                   measurement_ready_wire
);

// reg [7:0] debug = 0;


////////////////////////////////////////////////////
// for compressed TDC
////////////////////////////////////////////////////

reg   compressedTDC_fifo_rd_en_reg = 0;
always_ff @(posedge clk) begin
    compressedTDC_fifo_rd_en_reg       <= compressedTDC_fifo_rd_en;
end
logic [CMPTDCFIFO_WIDTH-1:0]       compressedTDC_fifo_rd_data_internal ;
assign compressedTDC_fifo_rd_data = compressedTDC_fifo_rd_data_internal;


//trng core definitions
wire trng_enable;
wire [TRNGCFG_WIDTH-1:0]trng_fine_cfg;
wire [TRNGCFG_WIDTH-1:0]trng_coarse_cfg;
wire [TRNG_WIDTH-1:0]trng_output;
wire trng_sample_vld;
wire  [TRNGCFG_WIDTH-1:0] tcl_fine_cfg;
wire  [TRNGCFG_WIDTH-1:0] tcl_coarse_cfg;
wire entropy_vld;
wire man_mode;
wire man_cfg;
wire stop;

//--------------------------------------------------------------
// Parameters
//--------------------------------------------------------------

localparam NUM_WORDS       = 1;
localparam LOG_WORDS       = $clog2(NUM_WORDS+1);


//--------------------------------------------------------------
// Signals
//--------------------------------------------------------------

// Configuration
logic [31:0]        measurements_remaining;

// Status

logic                       fifo_error;
logic                       finished;
logic                       fifo_idle;

// State machines
// typedef enum {
//    IDLE,
//    WAIT_TRIGGER,
//    INITIAL_DELAY,
//    MEASURING_0,
//    INTERMEDIATE_DELAY
// } State;
// State                       state;

localparam [3:0] IDLE               = 4'd0;
localparam [3:0] WAIT_TRIGGER       = 4'd1;
localparam [3:0] INITIAL_DELAY      = 4'd2;
localparam [3:0] MEASURING_0        = 4'd3;
localparam [3:0] INTERMEDIATE_DELAY = 4'd4;

reg  [3:0]  state = IDLE;

typedef enum {
   FIFO_IDLE,
   FIFO_WRITING_0,
   FIFO_WRITING_1
} FIFO_State;
FIFO_State                  fifo_state;
logic [LOG_WORDS-1:0]       fifo_write_remaining;

logic [31:0]        ro_counts_piped[7:0];

logic        enable_measurement;
// logic [2:0]  enable_measurement_counter;
logic        measurement_ready;
logic        measurement_ready_piped;
logic        measurement_ready_piped_2;

always_ff@(posedge clk) begin //for faster TDC read
    measurement_ready_piped_2<=measurement_ready_piped;
end

//--------------------------------------------------------------
// Assignments
//--------------------------------------------------------------
assign finished            = (state == IDLE);
assign fifo_idle           = (~compressedTDC_fifo_wr_en);
assign status              = {  8'd0,
                                measCount[7:0],
                                state, 4'd0, // 4 + 4 = 8 bits
                                1'b0, compressedTDC_fifo_full, compressedTDC_fifo_empty, fifo_idle, finished, 3'd0 // 8 bits
                            }; 
// assign status              = {24'd0, debug};


////////////////////////////////////
//// FIFO for Compressed TDC
///////////////////////////////////

// FIFO for Compressed TDC signals
reg                             compressedTDC_fifo_wr_en;
reg   [CMPTDCFIFO_WIDTH-1:0]    compressedTDC_fifo_data_wr;
wire                            compressedTDC_fifo_full;
wire  [CMPTDCFIFO_WIDTH-1:0]    compressedTDC_fifo_data_rd;

fifo_mem #(
    .WIDTH(CMPTDCFIFO_WIDTH),
    .DEPTH(CMPTDCFIFO_DEPTH)
) fifo_mem_compressedTDC (
    .clk(clk),
    .rst(rst || reset_axi),
    // .rst(rst),
    .wr(compressedTDC_fifo_wr_en),
    .rd(compressedTDC_fifo_rd_en),
    .din(compressedTDC_fifo_data_wr),
    .empty(compressedTDC_fifo_empty),
    .full(compressedTDC_fifo_full),
    .dout(compressedTDC_fifo_data_rd)
);

wire [255:0] tdc_rawData;
assign tdc_rawData = {ro_counts_piped[7], ro_counts_piped[6], ro_counts_piped[5], ro_counts_piped[4], ro_counts_piped[3], ro_counts_piped[2], ro_counts_piped[1], ro_counts_piped[0]};

reg [255:0] tdc_rawData_nonZero = 0;
always_ff@(posedge clk) begin
    if (tdc_rawData > 0) begin
        tdc_rawData_nonZero <= tdc_rawData;
    end
end

wire [CMPTDCFIFO_WIDTH-1:0] tdcCount1Value;

count1s #(
    .INP_WIDTH(256),
    .OUT_WIDTH(CMPTDCFIFO_WIDTH)
) count1s_cmpTDC (
    .enable (measurement_ready_piped_2),
    // .inData (tdc_rawData),
    .inData (tdc_rawData_nonZero),
    .outValue (tdcCount1Value)
);



///////////////////////////////////
// create measurement ready signal with hand since I have removed the controller
// make everything faster by applying measurement ready every 5 clock cycles
///////////////////////////////////

wire meas_count_divide;
reg [2:0]count_divide = 0;
assign meas_count_divide = (count_divide==3 && enable_measurement==1);
always_ff@(posedge clk) begin
    if (rst==1||count_divide==4||reset_axi==1) begin//ro_state is added for synchronization
        count_divide<=0;
    end else if (enable_measurement==1) begin
        count_divide<=count_divide+1;
    end
end

assign measurement_ready = meas_count_divide;


pipeline #(
    .BIT_WIDTH              (1),//1
    .N_STAGES               (N_STAGES)//5
) pipeline_meas_error (// every signal is 5 cycles later
    .clk                    (clk),
    .rst                    (rst || reset_axi),
    .pipe_in                (measurement_ready), // we only use the measurement ready of the first controller, because they all have the same timing
    .pipe_out               (measurement_ready_piped)
);

genvar jj;
generate
for (jj=0;jj<8;jj=jj+1) begin: pipeline_gen
    pipeline #(
        .BIT_WIDTH              (32),
        .N_STAGES               (N_STAGES)//5
    ) pipeline_counts_inst (
        .clk                    (clk),
        .rst                    (rst || reset_axi),
        .pipe_in                (trng_output[jj*32+31:jj*32]),
        .pipe_out               (ro_counts_piped[jj])
    );
end
endgenerate

//trng code

assign  stop=tdc_config[0];
assign  man_mode=tdc_config[4];
assign  man_cfg=tdc_config[8];
assign  tcl_fine_cfg=tdc_config[20:16];
assign  tcl_coarse_cfg=tdc_config[28:24];
 
//tdc controller
 
ctrl_unit #(
    .TRNGCFG_WIDTH(TRNGCFG_WIDTH),
    .TRNG_WIDTH   (TRNG_WIDTH)
) u_ctrl_unit(
    .clk            (clk),
    .rst            (rst||reset_axi),
    .stop           (stop),
    .man_mode       (man_mode),
    .man_cfg        (man_cfg),
    .entropy_vld    (entropy_vld),
    .trng_enable    (trng_enable),
    .trng_fine_cfg  (trng_fine_cfg),
    .trng_coarse_cfg(trng_coarse_cfg),
    .trng_output    (trng_output),
    .trng_valid_out (trng_sample_vld),
    .aws_fine_cfg   (tcl_fine_cfg),
    .aws_coarse_cfg (tcl_coarse_cfg)
);

//tdc instance
trng_core #(
    .TRNGCFG_WIDTH(TRNGCFG_WIDTH),
    .TRNG_WIDTH   (TRNG_WIDTH)
) u_trng_core(
    .clock     (clk),
    .reset     (rst||reset_axi),
    .enable    (trng_enable||enable_measurement),//either enabled by trng_ctrl or by the covert wrapper
    .fine_cfg  (trng_fine_cfg),
    .coarse_cfg(trng_coarse_cfg),
    .out       (trng_output),
    .valid     (trng_sample_vld)
);



//--------------------------------------------------------------
// Logic
//--------------------------------------------------------------

logic [31:0] tdc_initial_delay_counter = 0;
logic [31:0] tdc_intermediate_delay_counter = 0;
logic [31:0] TDC_INTERMEDIATE_DELAY_CYCLES = (local_stressor_count_cycles >> ($clog2(MEASUREMENTS_PER_CYCLES))); 
logic [31:0] TDC_INITIAL_DELAY_CYCLES = (TDC_INTERMEDIATE_DELAY_CYCLES >> 1); // measure in the middle
logic [31:0] TDC_TOTAL_MEASUREMENTS  = (measurement_num  << $clog2(MEASUREMENTS_PER_CYCLES));
logic [31:0] measCount = 0;
logic [31:0] measCount_prev = 0;
// logic [31:0] clk_counter = 0;
// logic enabled = 0;
// logic measurement_complete = 0;
// assign measurement_complete = clk_counter[local_stressor_count_cycles];
// logic ready_pulse;
// assign measurement_ready_wire = ready_pulse;


// Measurement logic
always_ff @(posedge clk) begin
    enable_measurement <= 0;
    // ready_pulse <= 0;
    // measurement_complete <= 0;
    if (rst) begin
        state <= IDLE;
        measurements_remaining <= 0;
        tdc_initial_delay_counter <= 0;
        tdc_intermediate_delay_counter <= 0;
        // clk_counter <= 0;
        // enabled <= 0;
        // ready_pulse <= 0;
        // measurement_complete <= 0;
        // enable_measurement_counter <= 0;
    end else begin
        // if (enabled) begin
        //     clk_counter <= clk_counter + 1'b1;
        // end

        case (state)
            IDLE: begin
                if (compressedTDC_fifo_empty & fifo_idle) begin
                   measurements_remaining <= measurement_num;
                   state <= WAIT_TRIGGER;
                end
            end
            WAIT_TRIGGER: begin
                if (start_trigger == 1'b1) begin
                    tdc_initial_delay_counter <= 0;
                    // clk_counter <= 0;
                    // enabled <= 1'b1;
                    state <= INITIAL_DELAY;
                end
            end

            INITIAL_DELAY: begin
                if (tdc_initial_delay_counter < TDC_INITIAL_DELAY_CYCLES) begin
                    tdc_initial_delay_counter <= tdc_initial_delay_counter + 1'b1;
                end else begin
                    tdc_initial_delay_counter <= 0;
                    // enable_measurement_counter <= 0;
                    measCount_prev <= measCount;
                    state <= MEASURING_0;
                end
            end

            // MEASURING_0: begin
            //     if(measurements_remaining == 0) begin
            //         enabled <= 1'b0;
            //         state <= IDLE;
            //     end else begin
            //         if(clk_counter[local_stressor_count_cycles] == 1'b1) begin
            //             measurement_complete <= 1'b1;
            //             measurements_remaining <= measurements_remaining - 1'b1;
            //             enabled <= 1'b0;
            //             clk_counter <= 0;
            //             state <= WAITING;
            //         end else begin
            //             enabled <= 1'b1;
            //             enable_measurement <= 1'b1;
            //             state <= MEASURING_0;
            //         end
            //     end
            // end

            // WAITING: begin
            //     if(average_done == 1'b1) begin
            //         ready_pulse <= 1'b1;
            //         state <= MEASURING_0;
            //     end
            // end

            MEASURING_0: begin
                if (measCount == (TDC_TOTAL_MEASUREMENTS - 1'b1)) begin
                // if (measCount == (TDC_TOTAL_MEASUREMENTS)) begin
                // if (measCount == (measurement_num)) begin
                    // finish
                    state <= IDLE;
                end else if (measCount == measCount_prev) begin
                    enable_measurement <= 1'b1;
                end else begin
                    tdc_intermediate_delay_counter <= 0;
                    state <= INTERMEDIATE_DELAY;
                end
            end
            INTERMEDIATE_DELAY: begin
                if (tdc_intermediate_delay_counter < TDC_INTERMEDIATE_DELAY_CYCLES) begin
                    tdc_intermediate_delay_counter <= tdc_intermediate_delay_counter + 1'b1;
                end else begin
                    tdc_intermediate_delay_counter <= 0;
                    // enable_measurement_counter <= 0;
                    measCount_prev <= measCount;
                    state <= MEASURING_0;
                end
            end
            default: state<=IDLE;         
        endcase
    end
end

////////////////////////////////////
//// Fifo write logic
////////////////////////////////////
always_ff @(posedge clk) begin
    compressedTDC_fifo_wr_en <= 0;// for compressed TDC
    if (rst == 1'b1) begin
        compressedTDC_fifo_data_wr <= 0;// for compressed TDC
        // fifo_error <= 0;
    end else begin
        compressedTDC_fifo_wr_en <= average_done;// for compressed TDC
        compressedTDC_fifo_data_wr <= average_result;
    end
end

////////////////////////////////////
//// Average Module logic
////////////////////////////////////
logic [31:0] average_counter = 0;
logic [31:0] average_reg = 0;
logic average_reg_reset = 0;
logic [CMPTDCFIFO_WIDTH-1:0] average_result = 0;
logic average_done = 0;

assign measurement_ready_wire = average_done;

always_ff @(posedge clk) begin 
    average_done <= 1'b0;
    average_reg_reset <= 1'b0;
    if(rst) begin
        average_counter <= 0;
        average_result <= 0;
        average_reg <= 0;
        measCount <= 0;
        average_reg_reset <= 0;
    end else begin

        if (state == WAIT_TRIGGER && start_trigger == 1'b1) begin
            average_counter <= 0;
            measCount <= 0;
            average_reg <= 0;
            average_result <= 0;
        end 

        if(average_reg_reset == 1'b1) begin
            average_reg <= 0;
            average_counter <= 0;
        end

        if (measurement_ready_piped_2 == 1'b1) begin
            if(average_counter == (MEASUREMENTS_PER_CYCLES - 1'b1)) begin
            // if(average_counter == (MEASUREMENTS_PER_CYCLES)) begin
            // if (measurement_complete == 1'b1) begin
                // average_counter <= 0;
                // average_result <= (average_reg  >> $clog2(MEASUREMENTS_PER_CYCLES)); // Dividing by no of measurements per cycle
                // average_result <= (average_reg  >> $clog2(average_counter)); 
                average_result <= average_reg ; // Dividing by no of measurements per cycle
                // average_reg <= 0;
                average_reg_reset <= 1'b1;
                average_done <= 1'b1;
            end else begin
                average_reg <= average_reg + tdcCount1Value;
                average_counter <= average_counter + 1'b1;
                measCount <= measCount + 1'b1;
            end
        end
    end 
end

// for compressed TDC
always_comb begin : ASSIGN_CMPTDC
    if (compressedTDC_fifo_rd_en_reg == 1'b1) begin
        compressedTDC_fifo_rd_data_internal = compressedTDC_fifo_data_rd;
    end else begin
        compressedTDC_fifo_rd_data_internal = 8'hfd;
    end
end

endmodule

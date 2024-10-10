
`default_nettype wire

module tdc #(
    parameter CMPTDCFIFO_WIDTH = 8,
    parameter CMPTDCFIFO_DEPTH = 4096,
    parameter CNT_WIDTH     = 32, // do not change this
    parameter N_STAGES      = 5,
    parameter TRNGCFG_WIDTH = 5,
    parameter TRNG_WIDTH    = 256 
) (
    input                         clk,
    input                         rst,//active high
    input                         start_trigger,
    input                         reset_axi,
    input  [31:0]                 measurement_num,
    input  [31:0]                 tdc_config,
    output [CNT_WIDTH-1:0]        status,

    input                         compressedTDC_fifo_rd_en,
    output wire                   compressedTDC_fifo_empty,
    output [CMPTDCFIFO_WIDTH-1:0] compressedTDC_fifo_rd_data
);


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

// FIFO signals
logic [CNT_WIDTH-1:0]       fifo_data_wr [7:0];
logic [CNT_WIDTH-1:0]       fifo_data_rd [7:0];
logic [CNT_WIDTH-1:0]       fifo_data_rd_mux ;// big mux for loading reading results
logic                       fifo_wr_en;
logic [7:0]                 fifo_full;

// Configuration
logic [31:0]        measurements_remaining;

// Status

logic [15:0]        num_measurements;
logic                       fifo_error;
logic                       finished;
logic                       fifo_idle;

// State machines
typedef enum {
   IDLE,
   WAIT_TRIGGER,
   MEASURING_0
} State;
State                       state;

typedef enum {
   FIFO_IDLE,
   FIFO_WRITING_0,
   FIFO_WRITING_1
} FIFO_State;
FIFO_State                  fifo_state;
logic [LOG_WORDS-1:0]       fifo_write_remaining;

logic [31:0]        ro_counts_piped[7:0];

logic        enable_measurement;
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
assign fifo_idle           = (fifo_state == FIFO_IDLE);
assign status              = {num_measurements, state, fifo_error, 1'b0, 1'b0, 
                              compressedTDC_fifo_full, compressedTDC_fifo_empty, fifo_idle, finished};



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
    .rst(rst),
    .wr(compressedTDC_fifo_wr_en),
    .rd(compressedTDC_fifo_rd_en),
    .din(compressedTDC_fifo_data_wr),
    .empty(compressedTDC_fifo_empty),
    .full(compressedTDC_fifo_full),
    .dout(compressedTDC_fifo_data_rd)
);

wire [255:0] tdc_rawData;
assign tdc_rawData = {ro_counts_piped[7], ro_counts_piped[6], ro_counts_piped[5], ro_counts_piped[4], ro_counts_piped[3], ro_counts_piped[2], ro_counts_piped[1], ro_counts_piped[0]};

wire [CMPTDCFIFO_WIDTH-1:0] tdcCount1Value;

count1s #(
    .INP_WIDTH(256),
    .OUT_WIDTH(CMPTDCFIFO_WIDTH)
) count1s_cmpTDC (
    .enable (measurement_ready_piped_2),
    .inData (tdc_rawData),
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
    .rst                    (rst),
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
        .rst                    (rst),
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


// Measurement logic
always_ff @(posedge clk) begin
    enable_measurement <= 0;
    if (rst) begin
        state <= IDLE;
        num_measurements <= 0;
        measurements_remaining <= 0;
    end else begin
        case (state)
            IDLE: begin
                // this was modified to automatically read 1000 measurements
                if (compressedTDC_fifo_empty & fifo_idle) begin
                   measurements_remaining <= measurement_num;
                   num_measurements <= 0;
                   state <= WAIT_TRIGGER;
                end
            end
            WAIT_TRIGGER: begin
                if (start_trigger) begin
                   state <= MEASURING_0;
                end
            end
            MEASURING_0: begin
                if (measCount == (measurement_num - 1'b1)) begin
                    // finish
                    state <= IDLE;
                end else begin
                    num_measurements <= num_measurements + 1'b1;
                    enable_measurement <= 1;
                    state <= MEASURING_0;
                end
            end
            default: state<=IDLE;         
        endcase
    end
end

reg [31:0] measCount = 0;


// Fifo write logic
always_ff @(posedge clk) begin
    fifo_wr_en  <= 0;
    compressedTDC_fifo_wr_en <= 0;// for compressed TDC
    if (rst == 1'b1) begin
        integer kk;
        for (kk=0;kk<8;kk=kk+1) begin
            fifo_data_wr[kk] <= 0;
        end
        compressedTDC_fifo_data_wr <= 0;// for compressed TDC
        fifo_error <= 0;
        fifo_write_remaining <= 0;
        fifo_state <= FIFO_IDLE;
        measCount <= 0;
    end else begin
        if (state == WAIT_TRIGGER && start_trigger == 1'b1) begin
            measCount <= 0;
        end

        case (fifo_state)
        FIFO_IDLE: begin
            if (measurement_ready_piped) begin //measurement_ready_piped is high every 5 cylces whne enabled
                fifo_write_remaining <= NUM_WORDS;//1 // usless
                fifo_state <= FIFO_WRITING_0;
                fifo_wr_en <=0;
                compressedTDC_fifo_wr_en <= 0;// for compressed TDC
            end
        end
        FIFO_WRITING_0: begin
            fifo_write_remaining <= fifo_write_remaining - 1;//0// usless
            if (measurement_ready_piped_2 == 1'b1  ) begin
                //measurement_ready_piped_2 is exactly one cycle later than measurement_ready_piped
                //make sure the code works with pulsed measurement ready for faster TDC read (once every 5 clocks)
                fifo_state <= FIFO_WRITING_0;
                measCount <= measCount + 1'b1;

                fifo_wr_en<=1;
                for (integer tt=0;tt<8;tt=tt+1) begin
                    fifo_data_wr[tt] <=ro_counts_piped[tt];
                end

                compressedTDC_fifo_wr_en <= 1'b1;// for compressed TDC
                compressedTDC_fifo_data_wr <= tdcCount1Value ; // for compressed TDC

            end else begin
                fifo_state <= FIFO_IDLE;
            end
        end
        endcase

        if (measurement_ready_piped && !fifo_idle) begin
            fifo_error <= 1;
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

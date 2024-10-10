

module tdc #(
    parameter CNT_WIDTH     = 32, // do not change this
    parameter FIFO_DEPTH    = 8192,// 
    parameter N_STAGES      = 5,
    parameter TRNGCFG_WIDTH = 5,
    parameter TRNG_WIDTH    = 256 
) (
    input                         clk,
    input                         rst,//active high
    input                         start_trigger,
    input                         reset_axi,//active high
    input  [31:0]                 measurement_num,
    input  [31:0]                 tdc_config,
    output [CNT_WIDTH-1:0]        status,
    input  [7:0]                  fifo_rd_en,
    output [7:0]                  fifo_empty,
    output [CNT_WIDTH-1:0]        fifo_data_0,
    output [CNT_WIDTH-1:0]        fifo_data_1,
    output [CNT_WIDTH-1:0]        fifo_data_2,
    output [CNT_WIDTH-1:0]        fifo_data_3,
    output [CNT_WIDTH-1:0]        fifo_data_4,
    output [CNT_WIDTH-1:0]        fifo_data_5,
    output [CNT_WIDTH-1:0]        fifo_data_6,
    output [CNT_WIDTH-1:0]        fifo_data_7,

    input  wire                     enable_tdcRealTimeRead,
    output wire [TRNG_WIDTH-1:0]    tdcRealTimeRead
);

reg  [7:0]                  fifo_rd_en_reg;// one cycle delay
reg  [7:0]                  fifo_rd_en_reg2;// one cycle delay

always_ff @(posedge clk) begin
    fifo_rd_en_reg      <= fifo_rd_en;
    fifo_rd_en_reg2     <= fifo_rd_en_reg;
end

// fifo data
reg [CNT_WIDTH-1:0]       fifo_data_internal_0 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_1 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_2 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_3 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_4 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_5 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_6 ;
reg [CNT_WIDTH-1:0]       fifo_data_internal_7 ;
assign fifo_data_0 = fifo_data_internal_0;
assign fifo_data_1 = fifo_data_internal_1;
assign fifo_data_2 = fifo_data_internal_2;
assign fifo_data_3 = fifo_data_internal_3;
assign fifo_data_4 = fifo_data_internal_4;
assign fifo_data_5 = fifo_data_internal_5;
assign fifo_data_6 = fifo_data_internal_6;
assign fifo_data_7 = fifo_data_internal_7;



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
// logic [CNT_WIDTH-1:0]       fifo_data_rd_mux ;//  big mux for loading reading results
logic                       fifo_wr_en;

logic                       [7:0]fifo_full;

// Configuration
logic [31:0]        measurements_remaining;

// Status

logic [15:0]        debug_num_measurements;
logic                       fifo_error;
logic                       finished;
logic                       fifo_idle;

// State machines
// typedef enum {
//    IDLE,
//    WAIT_TRIGGER,
//    MEASURING_0
// } State;
localparam IDLE         = 2'b00;
localparam WAIT_TRIGGER = 2'b01;
localparam MEASURING_0  = 2'b10;
localparam DELAY        = 2'b11;
reg [1:0]                   state = IDLE;

// typedef enum {
//    FIFO_IDLE,
//    FIFO_WRITING_0,
//    FIFO_WRITING_1
// } FIFO_State;
localparam FIFO_IDLE            = 2'b00;
localparam FIFO_WRITING_0       = 2'b01;
localparam FIFO_WRITING_1       = 2'b10;
reg [1:0]                     fifo_state = FIFO_IDLE;

logic [31:0]        tdc_readouts_piped[7:0];

logic        enable_measurement;
logic        measurement_ready;
logic        measurement_ready_piped;
logic        measurement_ready_piped_2;

always_ff@(posedge clk) begin // for faster TDC read
    measurement_ready_piped_2<=measurement_ready_piped;
end

//--------------------------------------------------------------
// Assignments
//--------------------------------------------------------------
assign finished            = (state == IDLE);
assign fifo_idle           = (fifo_state == FIFO_IDLE);
assign status              = {measurements_remaining[15:0], 
                                8'd0, debug_hasCounted, debug_hasStarted, 
                                state, fifo_error, fifo_full[0], fifo_empty[0], fifo_idle, finished};


//--------------------------------------------------------------
// Instantiations
//--------------------------------------------------------------

genvar j;
generate
for (j = 0;  j< 8; j = j+1) begin: fifo_gen
fifo_mem #(
    .WIDTH(32),
    .DEPTH(FIFO_DEPTH)
) fifo_mem_inst (
    .clk(clk),
    .rst(rst || reset_axi),
    .wr(fifo_wr_en),
    .rd(fifo_rd_en[j]),
    .din(fifo_data_wr[j]),
    .empty(fifo_empty[j]),
    .full(fifo_full[j]),
    .dout(fifo_data_rd[j])
);
end
endgenerate

//make everything faster by applying measurement ready every 5 clock cycles

reg [2:0] count_divide = 0;
wire resetdivide_condition;
assign resetdivide_condition = ((rst == 1'b1) || (reset_axi == 1'b1) 
                        || (count_divide == 3'd4)  || (startMeasurementSignal==1'b1));
always_ff@(posedge clk) begin
    if (resetdivide_condition == 1'b1) begin
        count_divide <= 0;
    end else if (enable_measurement == 1'b1) begin 
        count_divide <= count_divide + 1'b1;
    end else begin
        count_divide <= count_divide;
    end
end

assign measurement_ready = ((count_divide == 3'd3) && (enable_measurement == 1'b1));



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
        .pipe_out               (tdc_readouts_piped[jj])
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
    .enable    (trng_enable||enable_measurement || enable_tdcRealTimeRead),
    .fine_cfg  (trng_fine_cfg),
    .coarse_cfg(trng_coarse_cfg),
    .out       (trng_output),
    .valid     (trng_sample_vld)
);

/////////////////////////////////
///// real-time TDC outputs
////////////////////////////////
reg [TRNG_WIDTH-1:0]    realTimeRead_reg = 0;
always_ff @(posedge clk) begin : proc_
    if (rst==1'b1) begin
        realTimeRead_reg <= 0;
    end else begin
        realTimeRead_reg <= trng_output;
    end
end
assign tdcRealTimeRead = realTimeRead_reg;

//--------------------------------------------------------------
// Logic
//--------------------------------------------------------------

reg startMeasurementSignal = 0;

reg debug_hasStarted = 0;
reg debug_hasCounted = 0;

reg [7:0] delay_counter = 0;
localparam DELAYCYCLES = 8'd100;

// Measurement logic
always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        state <= IDLE;
        debug_num_measurements <= 0;
    end else begin
        enable_measurement <= 0;
        startMeasurementSignal <= 0;

        case (state)
            IDLE: begin
                // this was modified to automatically read measurement_num measurements
                // if ((fifo_empty[0]==1'b1) && (fifo_idle==1'b1)) begin
                if (fifo_empty[0] == 1'b1) begin
                   debug_num_measurements <= 0;
                   state <= WAIT_TRIGGER;
                end
            end

            WAIT_TRIGGER: begin
                if (start_trigger == 1'b1) begin
                    startMeasurementSignal <= 1'b1;
                    debug_hasStarted <= 1'b1;
                    measurements_remaining <= measurement_num;
                    state <= MEASURING_0;
                end
            end
            MEASURING_0: begin
                if (measurements_remaining > 0) begin
                    debug_hasCounted <= 1'b1;
                    measurements_remaining <= measurements_remaining - 1'b1;
                    debug_num_measurements <= debug_num_measurements + 1'b1;
                    enable_measurement <= 1'b1;
                    state <= MEASURING_0;
                end else begin 
                    delay_counter <= 0;
                    state <= DELAY;
                end
            end

            DELAY: begin
                if (delay_counter < DELAYCYCLES) begin
                    delay_counter <= delay_counter + 1'b1;
                end else begin
                    state <= IDLE;
                end
            end

            default: state<=IDLE;         
        endcase
    end
end

// Fifo write logic
always_ff @(posedge clk) begin
    if (rst==1'b1) begin
        fifo_data_wr [0] <= 0;
        fifo_data_wr [1] <= 0;
        fifo_data_wr [2] <= 0;
        fifo_data_wr [3] <= 0;
        fifo_data_wr [4] <= 0;
        fifo_data_wr [5] <= 0;
        fifo_data_wr [6] <= 0;
        fifo_data_wr [7] <= 0;
        fifo_error <= 0;
        fifo_state <= FIFO_IDLE;
    end else begin
        fifo_wr_en  <= 0;

        case (fifo_state)
            FIFO_IDLE: begin
                if (measurement_ready_piped == 1'b1) begin //measurement_ready_piped is high every 5 cylces whne enabled
                    fifo_state <= FIFO_WRITING_0;
                    fifo_wr_en <=0;
                end
            end

            FIFO_WRITING_0: begin
                if (measurement_ready_piped_2 == 1'b1) begin //measurement_ready_piped_2 is exactly one cycle later than measurement_ready_piped
                //modified this to make sure the code works with pulsed measurement ready for faster TDC read (once every 5 clocks)
                    fifo_state <= FIFO_WRITING_0;
                    fifo_wr_en <= 1;
                    fifo_data_wr[0] <= tdc_readouts_piped[0];
                    fifo_data_wr[1] <= tdc_readouts_piped[1];
                    fifo_data_wr[2] <= tdc_readouts_piped[2];
                    fifo_data_wr[3] <= tdc_readouts_piped[3];
                    fifo_data_wr[4] <= tdc_readouts_piped[4];
                    fifo_data_wr[5] <= tdc_readouts_piped[5];
                    fifo_data_wr[6] <= tdc_readouts_piped[6];
                    fifo_data_wr[7] <= tdc_readouts_piped[7];
                end else begin
                    fifo_state <= FIFO_IDLE;
                end
            end
        endcase

        if ((measurement_ready_piped==1'b1) && (fifo_idle==1'b0)) begin
            fifo_error <= 1;
        end
    end
end


always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_0 <= 0;
    end else begin
        if (fifo_rd_en_reg[0] == 1'b1) begin
            fifo_data_internal_0 <= fifo_data_rd[0];
        end else begin
            fifo_data_internal_0 <= fifo_data_internal_0;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_1 <= 0;
    end else begin
        if (fifo_rd_en_reg[1] == 1'b1) begin
            fifo_data_internal_1 <= fifo_data_rd[1];
        end else begin
            fifo_data_internal_1 <= fifo_data_internal_1;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_2 <= 0;
    end else begin
        if (fifo_rd_en_reg[2] == 1'b1) begin
            fifo_data_internal_2 <= fifo_data_rd[2];
        end else begin
            fifo_data_internal_2 <= fifo_data_internal_2;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_3 <= 0;
    end else begin
        if (fifo_rd_en_reg[3] == 1'b1) begin
            fifo_data_internal_3 <= fifo_data_rd[3];
        end else begin
            fifo_data_internal_3 <= fifo_data_internal_3;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_4 <= 0;
    end else begin
        if (fifo_rd_en_reg[4] == 1'b1) begin
            fifo_data_internal_4 <= fifo_data_rd[4];
        end else begin
            fifo_data_internal_4 <= fifo_data_internal_4;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_5 <= 0;
    end else begin
        if (fifo_rd_en_reg[5] == 1'b1) begin
            fifo_data_internal_5 <= fifo_data_rd[5];
        end else begin
            fifo_data_internal_5 <= fifo_data_internal_5;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_6 <= 0;
    end else begin
        if (fifo_rd_en_reg[6] == 1'b1) begin
            fifo_data_internal_6 <= fifo_data_rd[6];
        end else begin
            fifo_data_internal_6 <= fifo_data_internal_6;
        end
    end
end
always_ff @(posedge clk) begin
    if(rst == 1'b1) begin
        fifo_data_internal_7 <= 0;
    end else begin
        if (fifo_rd_en_reg[7] == 1'b1) begin
            fifo_data_internal_7 <= fifo_data_rd[7];
        end else begin
            fifo_data_internal_7 <= fifo_data_internal_7;
        end
    end
end


endmodule


`include "ro_defines.sv"
`include "defines.sv"

module phantum #(
    parameter NUM_RO_COUNTER = 4,// to be changed in top module
    parameter FIFO_SAMPLE_DEPTH = 1024
) (
    input wire          clk,
    input wire          reset,
    input wire [31:0]   delayCycles,

    input wire          debug_syncup,

    output wire [31:0]  debug_data_0,


    output wire    [NUM_RO_COUNTER-1:0]    fifo_empty,
    input  wire    [NUM_RO_COUNTER-1:0]    fifo_rd_en,

    output wire    [31:0]     fifo_data_rd_0,
    output wire    [31:0]     fifo_data_rd_1,
    output wire    [31:0]     fifo_data_rd_2,
    output wire    [31:0]     fifo_data_rd_3
    // output wire    [31:0]     fifo_data_rd_4

);
////////////////////////////
// local paramters or reg generated from parameters
////////////////////////////
wire [31:0] delayCycles_unit ;
assign delayCycles_unit = (delayCycles >> 2);
localparam NUM_MEAS = FIFO_SAMPLE_DEPTH;

////////////////////////////
// Debug output
////////////////////////////

// (* mark_debug = "true" *) reg [31:0] roCounts [1:0];
reg [31:0] debug_0 = 0;
assign debug_data_0 = debug_0;
// assign debug_data_1 = roCounts[1];
always_ff @(posedge clk) begin
    if (ro_counter_count[0] > 0) begin
        debug_0 <= ro_counter_count[0] ;
    end
end

////////////////////////////
// RO sensor
////////////////////////////
// ro ticks
wire ro_out;
// enable signal for ro
reg ro_enable_internal = 0;
(* DONT_TOUCH = "TRUE" *)
ring_oscillator #(
    .RO_TYPE(`RO_TYPE),
    .STAGES(`STAGES)
) ro_INST(
    .enable(ro_enable_internal),
    .ro_out(ro_out)
);

always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        ro_enable_internal <= 1'b1;
    end else begin
        ro_enable_internal <= ro_enable_internal;
    end
end

////////////////////////////
// RO counters
////////////////////////////


(* DONT_TOUCH = "TRUE", mark_debug = "true" *)  reg  [NUM_RO_COUNTER-1:0]  ro_counter_reset = 0;
(* DONT_TOUCH = "TRUE", mark_debug = "true" *)  wire [31:0] ro_counter_count [0:NUM_RO_COUNTER-1];
genvar i;
generate;
    for (i = 0; i < NUM_RO_COUNTER; i = i + 1) begin: GEN_RO_COUNTERS
        (* DONT_TOUCH = "TRUE" *)
        counter #(
            .COUNTER_BIT(32)
        ) counter_RO(
            .tick(ro_out),
            .reset(ro_counter_reset[i]),
            .count(ro_counter_count[i])
        );
    end
endgenerate


////////////////////////////
// FIFO to store the sample data
////////////////////////////

// FIFO IO wires
wire  [NUM_RO_COUNTER-1:0]    fifo_full;
reg   [NUM_RO_COUNTER-1:0]    fifo_wr_en = 0;
reg [31:0]      fifo_data_wr [0:NUM_RO_COUNTER-1];

wire    [31:0]     fifo_data_rd [0:NUM_RO_COUNTER-1];


//////////////////////////////////
// hardcode for the outputs
//////////////////////////////////
assign fifo_data_rd_0 = fifo_data_rd[0];
assign fifo_data_rd_1 = fifo_data_rd[1];
assign fifo_data_rd_2 = fifo_data_rd[2];
assign fifo_data_rd_3 = fifo_data_rd[3];
// assign fifo_data_rd_4 = fifo_data_rd[4];

////////////////////////////
// states
////////////////////////////

localparam IDLE             = 3'd0;
localparam OFFSET           = 3'd1;
localparam ROMEASURE        = 3'd2;
localparam CONTINUE_MEASURE = 3'd3;

////////////////////////////
// Main FSM
////////////////////////////

// states
(* mark_debug = "true" *) reg [2:0] state [0:NUM_RO_COUNTER-1];
// counter for the clock, referencing to the RO counter
reg [31:0] counter_offset [0:NUM_RO_COUNTER-1];
reg [31:0] counter_clk [0:NUM_RO_COUNTER-1];
reg [31:0] counter_sleep [0:NUM_RO_COUNTER-1];

reg [31:0] num_measurements_count [0:NUM_RO_COUNTER-1];

// different offset cycles
wire [31:0] offset_clock_cycles [0:NUM_RO_COUNTER-1];
assign offset_clock_cycles[0] = delayCycles_unit;
// Generate the logic
genvar j;
generate;
    for (j = 0 ; j < NUM_RO_COUNTER; j = j + 1) begin: GEN_RO_COUNTER_FSM
        // Instantiate FIFO
        fifo_mem #(
            .WIDTH(32),
            .DEPTH(FIFO_SAMPLE_DEPTH)
        ) fifo_sample_inst (
            .clk(clk),
            .rst(reset),
            .wr(fifo_wr_en[j]),
            .rd(fifo_rd_en[j]),
            .din(fifo_data_wr[j]),
            .empty(fifo_empty[j]),
            .full(fifo_full[j]),
            .dout(fifo_data_rd[j])
        );
        // 
        if (j > 0) begin
            assign offset_clock_cycles[j] = offset_clock_cycles[j-1] + delayCycles_unit;
        end
        // Control logic
        always_ff @(posedge clk) begin
            if (reset == 1'b1) begin
                state[j] <= IDLE;
                ro_counter_reset[j] <= 1'b1;
                counter_clk[j] <= 0;
                fifo_data_wr[j] <= 0;
                fifo_wr_en[j] <= 1'b0;
                num_measurements_count[j] <= 0;
            end else begin
                ro_counter_reset[j] <= 1'b0;
                fifo_wr_en[j] <= 1'b0;

                case (state[j])
                    IDLE: begin
                        // keep reseting the counter, sleep
                        ro_counter_reset[j] <= 1'b1;
                        // if start, 
                        if (debug_syncup == 1'b1) begin
                            state[j] <= OFFSET;
                            counter_offset[j] <= 0;
                        end else begin
                            state[j] <= IDLE;
                        end
                    end

                    OFFSET: begin
                        // keep reseting the counter, sleep
                        ro_counter_reset[j] <= 1'b1;
                        // for each offset counter, wait for several cycles
                        if (counter_offset[j] <= offset_clock_cycles[j] ) begin// offset
                            counter_offset[j] <= counter_offset[j] + 1'b1;
                        end else begin
                            counter_clk[j] <= 0;
                            state[j] <= ROMEASURE;
                        end
                    end

                    ROMEASURE: begin
                        if (counter_clk[j] < delayCycles) begin
                            counter_clk[j] <= counter_clk[j] + 1'b1;
                        end else begin
                            if (fifo_full[j] == 1'b0) begin
                                fifo_wr_en[j] <= 1'b1;
                                fifo_data_wr[j] <= ro_counter_count[j];
                            end
                            counter_sleep[j] <= 0;
                            num_measurements_count[j] <= num_measurements_count[j] + 1'b1;
                            state[j] <= CONTINUE_MEASURE;
                        end
                    end

                    CONTINUE_MEASURE: begin
                        // keep reseting the counter, sleep
                        ro_counter_reset[j] <= 1'b1;
                        // sleep for delay Cycles UNIT cycles
                        if (num_measurements_count[j] >= NUM_MEAS) begin
                            state[j] <= IDLE;
                        end else begin
                            // //// sleep
                            // if (counter_sleep[j] < delayCycles_unit) begin
                            //     counter_sleep[j] <= counter_sleep[j] + 1'b1;
                            // end else begin
                            //     counter_clk[j] <= 0;
                            //     state[j] <= ROMEASURE;
                            // end
                            //// not sleep
                            counter_clk[j] <= 0;
                            state[j] <= ROMEASURE;
                        end
                    end
                endcase
            end
        end
    end
endgenerate




endmodule

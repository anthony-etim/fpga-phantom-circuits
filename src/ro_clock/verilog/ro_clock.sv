`include "ro_defines.sv"
`include "defines.sv"

module ro_clock #(
    parameter COUNTER_BIT    = 32,
    parameter RO_TYPE        = `RO_LATCH,
    parameter CLOCKS_PER_BIT = 10000,
	parameter STAGES         = 2
)  (
    input wire clk,
    input wire debug_syncup,
    input wire reset,
    output wire ro_clk,
    output wire [31:0] ro_comp_count,
    output wire [31:0] mmcm_comp_count,
    output wire locked_status
);

////////////////////////////
// local paramters or reg generated from parameters
////////////////////////////

(* DONT_TOUCH = "TRUE" *) reg         ro_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] ro_counter_count;

(* DONT_TOUCH = "TRUE" *) reg         mmcm_counter_reset = 0;
(* DONT_TOUCH = "TRUE" *) wire [31:0] mmcm_counter_count;

// RO Counter
counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_RO(
    .tick(myROOutput),
    .reset(ro_counter_reset),
    .count(ro_counter_count)
);

// MMCM Counter
counter #(
    .COUNTER_BIT(COUNTER_BIT)
) counter_MMCM(
    .tick(clk_wiz_out),
    .reset(mmcm_counter_reset),
    .count(mmcm_counter_count)
);

////////////////////////////
// RO COMPARATOR WIRES
////////////////////////////
reg [31:0] ro_comp_count_reg;
assign ro_comp_count = ro_comp_count_reg;

////////////////////////////
// MMCM COMPARATOR WIRES
////////////////////////////
reg [31:0] mmcm_comp_count_reg;
assign mmcm_comp_count = mmcm_comp_count_reg;


////////////////////////////
// State machine parameters
////////////////////////////

localparam IDLE             = 3'd0;
localparam MEASURE          = 3'd1;
localparam CONTINUE_MEASURE = 3'd2;

////////////////////////////


////////////////////////////
// Control logic for measuring RO and MMCM COUNTS 
////////////////////////////

// Define register holding the state
(* mark_debug = "true" *) reg [2:0] state = IDLE;

// counter for the clock, referencing to the RO and MMCM counter
reg [31:0] counter_clk = 0;
// reg [31:0] num_measurements_count = 0;

always_ff @(posedge clk) begin
    if (reset == 1'b1) begin
        state <= IDLE;
        ro_counter_reset <= 1'b1;
        mmcm_counter_reset <= 1'b1;
        counter_clk <= 0;
        // num_measurements_count <= 0;
    end else begin
        ro_counter_reset <= 1'b0;
        mmcm_counter_reset <= 1'b0;

        case (state)

            IDLE: begin
                // keep reseting the counter, sleep
                ro_counter_reset <= 1'b1;
                mmcm_counter_reset <= 1'b1;
                // if start, 
                if (debug_syncup == 1'b1) begin
                    counter_clk <= 0;
                    state <= MEASURE;
                end else begin
                    state <= IDLE;
                end
            end

            MEASURE: begin
                if (counter_clk < CLOCKS_PER_BIT) begin
                    counter_clk <= counter_clk + 1'b1;
                    state <= MEASURE;
                end else begin
                    ro_comp_count_reg <= ro_counter_count;
                    mmcm_comp_count_reg <= mmcm_counter_count;
                    state <= CONTINUE_MEASURE;
                end
            end

            CONTINUE_MEASURE: begin
                // keep reseting the counter, sleep
                ro_counter_reset <= 1'b1;
                mmcm_counter_reset <= 1'b1;
                counter_clk <= 0;
                state <= MEASURE;
            end

            default: begin
                state <= IDLE;
            end
        endcase
    end
end


////////////////////////////
// RO sensor
////////////////////////////
reg       enableMyRO = 1'b1;
wire      myROOutput;
(* DONT_TOUCH = "TRUE" *)
ring_oscillator #(
    .RO_TYPE(RO_TYPE),
    .STAGES(STAGES)
) ring_oscillator_INST(
    .enable(enableMyRO),
    .ro_out(myROOutput)
);


////////////////////////////
// clk Wizard
////////////////////////////
wire clk_wiz_out;
assign clk_wiz_out = ro_clk;
wire locked;
assign locked = locked_status;
// reg reset = 0;

clk_wiz_ro_clock clk_wizard(
    // Clock out ports
    .clk_out1(clk_wiz_out),    // output clk_out1
    // Status and control signals
    .reset(reset),             // input reset
    .locked(locked),           // output locked
   // Clock in ports
    .clk_in1(myROOutput)       // input clk_in1
);      

endmodule


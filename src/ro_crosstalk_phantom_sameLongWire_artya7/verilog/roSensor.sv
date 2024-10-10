
`include "ro_defines.sv"
`include "defines.sv"


module roSensor (
    input wire          clk,
    input wire          rst,
    input wire          enableSensor,
    input wire [31:0]   meas_cycle,
    output wire [31:0]  roCount,
    output wire         roCount_valid
);

////////////////////////////
// Top ports
////////////////////////////
reg [31:0]  roCount_reg = 0;
reg         roCount_valid_reg = 0;
assign roCount = roCount_reg;
assign roCount_valid = roCount_valid_reg;

////////////////////////////
// RO and counter
////////////////////////////
// ro ticks
wire ro_out;
// ro counter reset and count
(* DONT_TOUCH = "TRUE", mark_debug = "true" *)  reg      ro_counter_reset = 0;
(* DONT_TOUCH = "TRUE", mark_debug = "true" *)  wire [31:0] ro_counter_count;

counter #(
    .COUNTER_BIT(32)
) counter_RO(
    .tick(ro_out),
    .reset(ro_counter_reset),
    .count(ro_counter_count)
);
// enable signal for ro
(* mark_debug = "true" *) reg ro_enable_internal = 0;

(* DONT_TOUCH = "TRUE" *)
ring_oscillator #(
    .RO_TYPE(`RO_TYPE),
    .STAGES(`STAGES)
) ro_INST(
    .enable(ro_enable_internal),
    .ro_out(ro_out)
);



////////////////////////////
// Ensure sensor enable signal asserted for 1 cycle
////////////////////////////
reg enableSensor_1cycle = 0;
reg e_internal = 0;
always_ff@(posedge clk) begin
    if (enableSensor == 1'b1) begin
        enableSensor_1cycle = ~e_internal; // ensure that only valid for one cycle, every time the send changes from 0 to 1
        e_internal = 1'b1;
    end else begin
        enableSensor_1cycle = 0;
        e_internal = 0;
    end
end


////////////////////////////
// Control logic
////////////////////////////
localparam IDLE         = 3'd0;
localparam ROMEASURE    = 3'd1;
reg [2:0] state = IDLE;
reg [2:0] return_state = IDLE;

// clock counter
reg [31:0] clkCounter = 0;


always_ff @(posedge clk) begin
    if (rst == 1'b1) begin
        ro_counter_reset <= 1'b1;
        ro_enable_internal <= 0;
        roCount_reg <= 0;
    end else begin
        ro_counter_reset <= 0;
        roCount_valid_reg <= 0;

        case(state)
            IDLE: begin
                if (enableSensor_1cycle == 1'b1) begin
                    ro_counter_reset <= 1'b1;
                    ro_enable_internal <= 1'b1;
                    clkCounter <= 0;
                    state <= ROMEASURE;
                end else begin
                    ro_counter_reset <= 1'b1;
                    ro_enable_internal <= 0;
                    state <= IDLE;
                end
            end

            ROMEASURE: begin
                if (clkCounter < meas_cycle) begin
                    clkCounter <= clkCounter + 1'b1;
                end else begin
                    roCount_reg <= ro_counter_count;
                    roCount_valid_reg <= 1'b1;
                    ro_enable_internal <= 0;
                    state <= IDLE;
                end
            end
        endcase
    end
end



endmodule

`include "parameters.vh"

module ring_oscillator #(
    parameter RO_TYPE   = RO_LUT
)(
    input               enable,
    output              ro_out
);

(* DONT_TOUCH = "TRUE" *)
wire [2:0]              ro_wire;

assign ro_out = ro_wire[2];

(* DONT_TOUCH = "TRUE" *)
LUT2 #(
    .INIT               (4'b1000)
) ro_0 (
    .I0                 (ro_wire[0]),
    .I1                 (enable),
    .O                  (ro_wire[1])
);

(* DONT_TOUCH = "TRUE" *)
LUT1  #(
   .INIT                (2'b01)
) ro_1 (
    .I0                 (ro_wire[1]),
    .O                  (ro_wire[2])
);

generate
if (RO_TYPE == RO_LATCH) begin

(* DONT_TOUCH = "TRUE" *)
LD ro_2(
    .G                  (1),
    .D                  (ro_wire[2]),
    .Q                  (ro_wire[0])
);

end else if (RO_TYPE == RO_LUT) begin

(* DONT_TOUCH = "TRUE" *)
LUT1  #(
   .INIT                (2'b10)
) ro_2 (
    .I0                 (ro_wire[2]),
    .O                  (ro_wire[0])
);

end else if (RO_TYPE == RO_REGISTER) begin

(* DONT_TOUCH = "TRUE" *)
wire ff_clk;

(* DONT_TOUCH = "TRUE" *)
LUT1  #(
   .INIT                (2'b01)
) ro_clk_lut (
    .I0                 (ro_wire[2]),
    .O                  (ff_clk)
);

(* DONT_TOUCH = "TRUE" *)
FDPE #(
    .INIT               (1'b0)
) ro_2 (
    .PRE                (ro_wire[2]),
    .CE                 (1),
    .D                  (0),
    .C                  (ff_clk),
    .Q                  (ro_wire[0])
);

end else begin
    $error("Invalid RO_TYPE. Allowed values: RO_LUT (%d), RO_LATCH (%d), RO_REGISTER (%d)", RO_LUT, RO_LATCH, RO_REGISTER);
end

endgenerate

endmodule
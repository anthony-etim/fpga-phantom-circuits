`include "parameters.vh"

module ring_oscillator #(
    parameter RO_TYPE   = RO_LUT,
    parameter STAGES    = 2
)(
    input               enable,
    output              ro_out
);

// Added additional stage as otherwise too fast for counting (timing violations)

localparam LAST         = STAGES+1;

(* DONT_TOUCH = "TRUE" *)
wire [LAST:0]           ro_wire;

assign ro_out = ro_wire[LAST];

(* DONT_TOUCH = "TRUE" *)
LUT2 #(
    .INIT               (4'b0100)
) ro_inv (
    .I0                 (ro_wire[0]),
    .I1                 (enable),
    .O                  (ro_wire[1])
);

genvar i;
generate

for (i = 0; i < STAGES; i = i + 1) begin : ro_stages
    (* DONT_TOUCH = "TRUE" *)
    LUT1  #(
        .INIT           (2'b10)
    ) ro_buf (
        .I0             (ro_wire[i + 1]),
        .O              (ro_wire[i + 2])
    );
end

if (RO_TYPE == RO_LATCH) begin

(* DONT_TOUCH = "TRUE" *)
LD ro_ld (
    .G                  (1),
    .D                  (ro_wire[LAST]),
    .Q                  (ro_wire[0])
);

end else if (RO_TYPE == RO_LUT) begin

if (STAGES < 0) begin
assign ro_wire[0] = ro_wire[LAST];
end else begin
(* DONT_TOUCH = "TRUE" *)
LUT1  #(
   .INIT                (2'b10)
) ro_lut (
    .I0                 (ro_wire[LAST]),
    .O                  (ro_wire[0])
);
end

end else if (RO_TYPE == RO_REGISTER) begin

(* DONT_TOUCH = "TRUE" *)
wire ff_clk;

(* DONT_TOUCH = "TRUE" *)
LUT1  #(
   .INIT                (2'b01)
) ro_clk_lut (
    .I0                 (ro_wire[LAST]),
    .O                  (ff_clk)
);

(* DONT_TOUCH = "TRUE" *)
FDPE #(
    .INIT               (1'b0)
) ro_ff (
    .PRE                (ro_wire[LAST]),
    .CE                 (1),
    .D                  (0),
    .C                  (ff_clk),
    .Q                  (ro_wire[0])
);

end else begin
initial begin
    $error("Invalid RO_TYPE. Allowed values: RO_LUT (%d), RO_LATCH (%d), RO_REGISTER (%d)", RO_LUT, RO_LATCH, RO_REGISTER);
end
end

endgenerate

endmodule

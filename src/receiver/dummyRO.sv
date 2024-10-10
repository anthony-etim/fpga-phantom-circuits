`include "ro_defines.sv"

module dummyRO #(
    parameter RO_TYPE   = `RO_LATCH,
    parameter STAGES    = 2
)(
    input               enable,
    output              ro_out
);

//wire [0:0] ro_wire;
assign ro_out = 1'b1;

endmodule

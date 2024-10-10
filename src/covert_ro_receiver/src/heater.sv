`include "parameters.vh"

module heater #(
    parameter ROS     	= 5,
	parameter RO_TYPE	= RO_LUT,
	parameter STAGES	= 2
)(
    input   enable
);

genvar i;
generate
for (i = 0; i < ROS; i = i+1) begin : ro_gen
	(* DONT_TOUCH = "TRUE" *)
	ring_oscillator #(
		.RO_TYPE		(RO_TYPE),
		.STAGES			(STAGES)
	) ro (
	    .enable			(enable),
	    .ro_out			()
	);
end
endgenerate

endmodule

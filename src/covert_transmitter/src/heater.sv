`include "parameters.vh"

module heater #(
    parameter NUM_ROS   = 5,
    parameter RO_TYPE	= RO_LUT
)(
    input   enable
);

genvar i;
generate
for (i = 0; i < NUM_ROS; i = i+1) begin : ro_gen
	(* DONT_TOUCH = "TRUE" *)
	ring_oscillator #(
	    .RO_TYPE		(RO_TYPE)
	) ro (
	    .enable			(enable),
	    .ro_out			()
	);
end
endgenerate

endmodule

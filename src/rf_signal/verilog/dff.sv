`timescale 1ns/1ps
module dff #(
	parameter WIDTH = 1
	)(
	input logic             clk,
	input logic             reset,
	input logic [WIDTH-1:0] d,
	(* dont_touch = "true" *) output logic [WIDTH-1:0] q
	);

always_ff @(posedge clk) begin
	if(reset == 1'b1) begin
		q <= '0;
	end else begin
		q <= d;
	end
end

endmodule

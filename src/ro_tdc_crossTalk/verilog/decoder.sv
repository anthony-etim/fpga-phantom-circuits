`timescale 1ns / 1ps
module thermometer_decoder #(parameter input_size=5) (in, out, out_bar);
	input  logic [(input_size-1):0] 		in;
	output logic [((1<<input_size)-1):0] 	out;
	output logic [((1<<input_size)-1):0] 	out_bar;

    assign out_bar = ('1 << 1) << in;
    assign out     = ~out_bar;
endmodule

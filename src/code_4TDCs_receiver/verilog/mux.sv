`timescale 1ns/1ps
module mux_2x1 #(
  parameter WIDTH = 1
  )(
  input  logic sel,
  input  logic [WIDTH-1:0] a,
  input  logic [WIDTH-1:0] b,
  output logic [WIDTH-1:0] y);
assign y = sel ? b : a;
endmodule

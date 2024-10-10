`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2022 02:56:00 PM
// Design Name: 
// Module Name: tb_async_fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_async_fifo();

reg wr_clk, rd_clk;
initial wr_clk = 0;
initial rd_clk = 0;
always wr_clk = #4 ~wr_clk;
always rd_clk = #1 ~rd_clk;
    
reg [7:0] din;
reg wr_en;
wire full, empty;
reg rd_en;
wire [7:0] dout;
    
reg reset;
task reset_task;
begin
	reset <= 0;
	din <= 0;
	wr_en <= 0;
	rd_en <= 0;
	repeat (10) @(posedge rd_clk);
	reset <= 1;
	repeat (10) @(posedge rd_clk);
	reset <= 0;
end
endtask

task delay;
input	[31:0] d;
begin
	repeat (d) @(posedge rd_clk);
end
endtask

    
initial begin
	reset_task;
	
	delay(120);

	din <= 10;
	wr_en <= 1;
	delay(4);
	
	din <= 0;
	wr_en <= 0;
    delay(120);
    
    din <= 2;
	wr_en <= 1;
	delay(4);
	
	din <= 0;
	wr_en <= 0;
    delay(120);
    
    rd_en <=1;
    delay(1);
    
    rd_en <=0;
    delay(120);
    
    rd_en <=1;
    delay(1);
    
    rd_en <=0;
    delay(120);
    
	
	$finish;
end


fifo_generator_0 fifo_generator_0 (
  .rst(reset),        // input wire rst
  .wr_clk(wr_clk),  // input wire wr_clk 100MHz
  .rd_clk(rd_clk),  // input wire rd_clk 400MHz
  
  .din(din),        // input wire [7 : 0] din
  .wr_en(wr_en),    // input wire wr_en
  
  .rd_en(rd_en),    // input wire rd_en
  .dout(dout),      // output wire [7 : 0] dout
  
  .full(full),      // output wire full
  .empty(empty)    // output wire empty
);

endmodule

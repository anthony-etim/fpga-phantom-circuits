/*
 * This is testbench for the fifo_mem module
 * 
 * Copyright (C): 2019
 * Author:           Shanquan Tian <shanquan.tian@yale.edu>
 * Updated:          2019-09-29
 *                
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
*/

// FIFO based on block ram.
// Usage: 1) Please reset fifo at the biginning. 
//           For example, #10; reset_fifo <= 0; #10; reset_fifo <= 1; #10; reset_fifo <= 0;
//        2) Set rd as high for one clock cycle, you will get data after one cycle;
//        3) Set wr as high for one clock cycle.
//        4) Do not wr and rd at the same time at the biggning. 
//           You can wr and rd at the same time if FIFO is not empty.
// a[0],       a[1],     ... ,   a[n-1]
// addr_1_reg                    addr_0_reg
// read                          write



`timescale 1ns / 1ps

module testbench;

parameter WIDTH = 64;
parameter DEPTH = 16;// Must be power of two

reg clk = 1;
always 
  # 5 clk = !clk;

reg rst = 1'b0;
reg wr = 1'b0;
reg rd = 1'b0;
reg [WIDTH-1:0]  din;
wire empty;
wire full;
wire [WIDTH-1:0]  dout;

fifo_mem #(
    .WIDTH(WIDTH),
    .DEPTH(DEPTH)
) fifo_mem_test (
    .clk(clk) ,
    .rst(rst) ,
    .wr(wr) ,
    .rd(rd) ,
    .din(din) ,
    .empty(empty) ,
    .full(full) ,
    .dout(dout)
);



integer i;
initial begin
    $dumpfile ("tb_fifo_mem.vcd");
    $dumpvars(0, fifo_mem_test);
    //for (i=0;i<RDMNUM/2-1;i=i+1) begin
    //    $dumpvars(1, sort_test.sortCore_0.addr_0_tmp[i]);
    //end
end




initial begin
    #10;
    rst = 1;
    #10;
    rst = 0;

    #80;
    for (i = 0; i < DEPTH; i = i + 1'b1) begin
    	wr <= 1'b1;
    	din <= i+1;
    	#10;
    	wr <= 1'b0;
    	#10;
    end
    #10;
    $writememb("mem_sort_write0.txt", fifo_mem_test.mem_dual_in_fifo.mem);
    #100;
    wr <= 1'b1;
    rd <= 1'b1;
    din <= 46574984;
    #10;
    wr <= 1'b0;
    rd <= 1'b0;
    $writememb("mem_sort_writeread.txt", fifo_mem_test.mem_dual_in_fifo.mem);


    #80;
    for (i = 0; i < DEPTH; i = i + 1'b1) begin
    	rd <= 1'b1;
    	#10;
    	rd <= 1'b0;
    	#10;
    end
    #10;
    $writememb("mem_sort_read0.txt", fifo_mem_test.mem_dual_in_fifo.mem);


    #100;
    wr <= 1'b1;
	din <= 55;
	#10;
	wr <= 1'b0;
	#10;

    #100;
    wr <= 1'b1;
    din <= 520;
    #10;
    wr <= 1'b0;

    #50;
    $writememb("mem_sort_write1.txt", fifo_mem_test.mem_dual_in_fifo.mem);

    #100;
    rd <= 1'b1;
	#10;
	rd <= 1'b0;
	#10;

	#100;
    rd <= 1'b1;
	#10;
	rd <= 1'b0;
	#10;

    #80;
    for (i = 0; i < DEPTH; i = i + 1'b1) begin
    	wr <= 1'b1;
    	din <= i+1;
    	#10;
    	wr <= 1'b0;
    	#10;
    end
    #10;
    #100;
    wr <= 1'b1;
    rd <= 1'b1;
    din <= 46574984;
    #10;
    wr <= 1'b0;
    rd <= 1'b0;


    #80;
    for (i = 0; i < DEPTH; i = i + 1'b1) begin
    	rd <= 1'b1;
    	#10;
    	rd <= 1'b0;
    	#10;
    end
    #10;
    
    
    #100;
    $finish;
end


initial begin
    $monitor ("%6d\t rst = %b , wr=%b, rd=%b, din=%d, empty=%b, full=%b, dout=%d, size = %d", 
    	($time),rst,  wr, rd, din, empty, full, dout, fifo_mem_test.size);
end





endmodule
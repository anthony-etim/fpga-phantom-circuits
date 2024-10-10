/*
 * This is testbench for the counter module
 * 
 * Copyright (C): 2021
 * Author:           Anthony Etim <anthony.etim@yale.edu>
 * Updated:          2021-10-05
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


`timescale 1ns / 1ps

module testbench;

reg clk = 1;

always 
  # 5 clk = !clk;

reg rst = 1'b0;

reg enable = 0;
wire [7:0] count;

counter #(
    .BIT_SIZE(8)
) yourCounterModule(
    .tick (clk),
    .reset (rst), 
    //.enable (enable),
    .count (count)
);


integer i;
initial begin
    $dumpfile ("tb_counter.vcd");
    $dumpvars(0, yourCounterModule);
end




initial begin
    #10;
    rst = 1;
    //enable = 0;
    #10;
    rst = 0;
    //enable = 1;

// 

    #100;
    $finish;
end


initial begin
    // $monitor ("%6d\t rst = %b , wr=%b, rd=%b, din=%d, empty=%b, full=%b, dout=%d, size = %d", 
    // 	($time),rst,  wr, rd, din, empty, full, dout, fifo_mem_test.size);
    $monitor ("%6d\t rst = %b, clk = %b, count=%d ",
         ($time), rst, clk, count);

end

endmodule
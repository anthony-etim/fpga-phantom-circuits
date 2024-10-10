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

`include "ro_defines.sv"


module testbench;

reg clk = 1'b1;

always 
  # 5 clk = !clk;

reg rst = 1'b0;

reg receive = 1'b0;
wire [7:0] data;
wire gotData;

wire [31:0]  debug_ro_counts_zero;
wire [31:0]  debug_ro_counts_one;
wire [31:0]  debug_ro_counts_two;
wire [31:0]  debug_ro_counts_three;
wire [31:0]  debug_ro_counts_four;
wire [31:0]  debug_ro_counts_five;
wire [31:0]  debug_ro_counts_six;
wire [31:0]  debug_ro_counts_seven;

receiver #(
    .CLOCKS_PER_BIT(10),
    .BIT_SIZE(8),
    .RO_TYPE(`RO_LATCH),
    .STAGES(5),
    .COOLDOWN_CYCLES(10)
) yourReceiverModule(
    .clock (clk),
    .reset (rst), 

    .receive (receive),
    .clock_per_bit (10),
    .threshold(1),
    .data (data),
    .gotData (gotData),

    .debug_ro_counts_zero(debug_ro_counts_zero),
    .debug_ro_counts_one(debug_ro_counts_one),
    .debug_ro_counts_two(debug_ro_counts_two),
    .debug_ro_counts_three(debug_ro_counts_three),
    .debug_ro_counts_four(debug_ro_counts_four),
    .debug_ro_counts_five(debug_ro_counts_five),
    .debug_ro_counts_six(debug_ro_counts_six),
    .debug_ro_counts_seven(debug_ro_counts_seven)
);




integer i;
initial begin
    $dumpfile ("tb_receiver.vcd");
    $dumpvars(0, yourReceiverModule);
end


initial begin
    rst = 0;
    receive = 0;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    receive = 1;
    #10;
    receive = 0;


    # 5000;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    receive = 1;
    #10;
    receive = 0;

    # 5000;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    receive = 1;
    #10;
    receive = 0;
// 

    #200000;
    $finish;
end


initial begin
    // $monitor ("%6d\t rst = %b , wr=%b, rd=%b, din=%d, empty=%b, full=%b, dout=%d, size = %d", 
    // 	($time),rst,  wr, rd, din, empty, full, dout, fifo_mem_test.size);
    $monitor ("%6d\t  receive=%b, rst=%b, data=%b || startROMeasure=%b, gotData=%b, state = %d",
         ($time), receive, rst,  data, yourReceiverModule.startROMeasure, gotData, yourReceiverModule.state);

end

endmodule
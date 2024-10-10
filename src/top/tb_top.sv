/*
 * This is testbench for the top module
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

`include "../../receiver/ro_defines.sv"


module testbench;

reg clk = 1'b1;

always 
  # 5 clk = !clk;

reg rst = 1'b0;

reg send = 1'b0;
reg enable = 1'b0;
reg [7:0] input_Data = 8'b10101010;
wire gotData;
wire [7:0] output_Data;

top #(
    .CLOCKS_PER_BIT(10),
    .BIT_SIZE(8),
    .RO_TYPE(`RO_LATCH),
    .STAGES(5)
) yourtopModule(
    .clock (clk),
    .reset (rst), 
    .send (send),    
    .enable (enable),
    .input_Data (input_Data),
    .gotData (gotData),
    .output_Data(output_Data)
);


integer i;
initial begin
    $dumpfile ("tb_top.vcd");
    $dumpvars(0, yourtopModule);
end


initial begin
    #10;
    rst = 1;
    enable = 0;
    send = 0;
    #10;
    rst = 0;
    enable = 1;
    send = 1;
    input_Data = 8'b00010000;
    #10;
    enable = 0;
    send = 0;

    #1000;
    enable = 0;
    send = 0;
    #10;
    rst = 0;
    enable = 1;
    send = 1;
    input_Data = 8'b00010011;
    #10;
    enable = 0;
    send = 0;


// 

    #1000000;
    $finish;
end


initial begin
    // $monitor ("%6d\t rst = %b , wr=%b, rd=%b, din=%d, empty=%b, full=%b, dout=%d, size = %d", 
    // 	($time),rst,  wr, rd, din, empty, full, dout, fifo_mem_test.size);
   // $monitor ("%6d\t  send=%b, rst=%b, enable=%b, input_Data=%b, gotData=%b, output_Data=%b, ", 
   //      ($time), send, rst, enable, input_Data, gotData, output_Data);
    // $monitor ("%6d\t  send=%b, rst=%b, enable=%b, input_Data=%b, gotData=%b, output_Data=%b, tx_wire = %b",
    //      ($time), send, rst, enable, input_Data, gotData, output_Data, yourtopModule.tx_Output);
    $monitor ("%6d\t  send=%b, rst=%b, enable=%b, input_Data=%b, gotData=%b, output_Data=%b, tx_wire = %b, tx_index = %d, rxstate= %d",
         ($time), send, rst, enable, input_Data, gotData, output_Data, yourtopModule.tx_Output, yourtopModule.transmitter_INST.index, yourtopModule.receiver_INST.state
);

end

endmodule
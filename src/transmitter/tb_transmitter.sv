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

reg clk = 1'b1;

always 
  # 5 clk = !clk;

reg rst = 1'b0;

reg send = 1'b0;
reg [7:0] data = 8'b10101010;
// reg [7:0] data = 8'b11111111;
// reg [7:0] data = 0;
// wire [0:0] tx_wire;
wire tx_done;
wire tx_wire_debug_valid;
transmitter #(
    .COOLDOWN_CYCLES(10),
    .BIT_SIZE(8)
) yourTransmitterModule(
    .send (send),
    .clock (clk),
    .reset (rst), 
    .clock_per_bit (10),
    .data (data),
    .tx_wire_debug (tx_wire),
    .tx_wire_debug_valid(tx_wire_debug_valid),
    .done(tx_done)
);


integer i;
initial begin
    $dumpfile ("tb_transmitter.vcd");
    $dumpvars(0, yourTransmitterModule);
end


initial begin
    rst = 0;
    send = 0;
    data = 8'b10101010;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    send = 1;
    #10;
    send = 0;


    # 5000;
    data = 8'b11111111;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    send = 1;
    #10;
    send = 0;

    # 5000;
    data = 0;
    #10;
    rst = 1;
    #10;
    rst = 0;
    // #10;
    send = 1;
    #10;
    send = 0;
// 

    #200000;
    $finish;
end


initial begin
    // $monitor ("%6d\t rst = %b , wr=%b, rd=%b, din=%d, empty=%b, full=%b, dout=%d, size = %d", 
    // 	($time),rst,  wr, rd, din, empty, full, dout, fifo_mem_test.size);
    $monitor ("%6d\t  send=%b,  rst=%b, data=%b => tx_wire=%b, valid=%b, tx_done=%b, state = %d",
         ($time), send, rst, data, tx_wire, tx_wire_debug_valid, tx_done, yourTransmitterModule.state);

end

endmodule
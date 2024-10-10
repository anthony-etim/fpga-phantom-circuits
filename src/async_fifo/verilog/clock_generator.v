`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 04:15:33 PM
// Design Name: 
// Module Name: clock_generator
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


module clock_generator(
    input sys_clk,
    input sys_rst_p,
    
    // output clocks 
    output clk_400m,
    output clk_100m,
    output clk_locked
    );
    
clk_wiz_0 clk_wiz_0
(
    // Clock out ports
    .clk_out_400m(clk_400m),     // output clk_out_400m
    .clk_out_100m(clk_100m),     // output clk_out_100m
    // Status and control signals
    .reset(sys_rst_p), // input reset
    .locked(clk_locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk)
);      // input clk_in1


endmodule

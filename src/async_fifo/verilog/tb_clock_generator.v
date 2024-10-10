`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 09:22:02 PM
// Design Name: 
// Module Name: tb_clock_generator
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


module tb_clock_generator;

    reg sys_clk;
    reg reset;
    
    wire clk_400m;
    wire clk_100m;
    wire clk_locked;
    
clock_generator clock_generator(
    .sys_clk            (sys_clk),
    .sys_rst_p          (reset),
        
    // output clocks 
    .clk_400m           (clk_400m),          
    .clk_100m           (clk_100m),
    .clk_locked         (clk_locked)
    );    
    
    initial begin
        sys_clk = 0;
        reset = 0;
        
        #100; 
        reset = 1;
        #100;
        reset = 0;
    end
    
    always #10 sys_clk = ~sys_clk;
    
endmodule

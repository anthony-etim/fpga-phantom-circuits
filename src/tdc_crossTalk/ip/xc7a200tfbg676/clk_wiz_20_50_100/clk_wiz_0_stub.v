// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Wed Feb 16 23:22:26 2022
// Host        : caslab-srv3 running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/shanquan/git/fpga-phantom-circuits/src/tdc_crossTalk/ip/xc7a200tfbg676/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out_90, clk_out_100, clk_out112, 
  clk_out_128, clk_out_150, reset, locked, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_out_90,clk_out_100,clk_out112,clk_out_128,clk_out_150,reset,locked,clk_in" */;
  output clk_out_90;
  output clk_out_100;
  output clk_out112;
  output clk_out_128;
  output clk_out_150;
  input reset;
  output locked;
  input clk_in;
endmodule

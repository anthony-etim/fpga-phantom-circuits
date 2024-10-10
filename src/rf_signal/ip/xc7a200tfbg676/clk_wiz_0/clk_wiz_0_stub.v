// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
// Date        : Thu Mar 31 21:06:11 2022
// Host        : caslab-cloudfpga running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/jim33/eeng428-spring2022-project-2-1/templates/tdc/ip/xc7a200tfbg676/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg676-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out_20, clk_out_25, clk_out_30, clk_out_35, 
  clk_out_40, clk_out_45, clk_out_50, reset, locked, clk_in)
/* synthesis syn_black_box black_box_pad_pin="clk_out_20,clk_out_25,clk_out_30,clk_out_35,clk_out_40,clk_out_45,clk_out_50,reset,locked,clk_in" */;
  output clk_out_20;
  output clk_out_25;
  output clk_out_30;
  output clk_out_35;
  output clk_out_40;
  output clk_out_45;
  output clk_out_50;
  input reset;
  output locked;
  input clk_in;
endmodule

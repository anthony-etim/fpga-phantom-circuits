// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Apr 14 14:58:02 2022
// Host        : caslab-cloudfpga running 64-bit Ubuntu 18.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/shanquan/git/fpga-phantom-circuits/src/ro_crosstalk_phantum_sameLongWire/Vivado/vivadoProject_ip/ipClock/ipClock.srcs/sources_1/ip/clk_wiz_0_1/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out_50, clk_out_100, clk_out_150, 
  clk_out_200, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="clk_out_50,clk_out_100,clk_out_150,clk_out_200,reset,locked,clk_in1" */;
  output clk_out_50;
  output clk_out_100;
  output clk_out_150;
  output clk_out_200;
  input reset;
  output locked;
  input clk_in1;
endmodule

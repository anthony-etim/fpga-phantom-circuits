-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
-- Date        : Sun Feb  5 21:54:13 2023
-- Host        : caslab-wkst2 running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/ip/xc7a200tfbg676/project_ip_temporal/project_ip_temporal.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_out_20 : out STD_LOGIC;
    clk_out_30 : out STD_LOGIC;
    clk_out_40 : out STD_LOGIC;
    clk_out_50 : out STD_LOGIC;
    clk_out_60 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out_20,clk_out_30,clk_out_40,clk_out_50,clk_out_60,reset,locked,clk_in";
begin
end;

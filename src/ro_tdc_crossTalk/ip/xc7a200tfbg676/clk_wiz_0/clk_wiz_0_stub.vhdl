-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri Feb 18 11:44:19 2022
-- Host        : caslab-srv3 running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/shanquan/git/fpga-phantom-circuits/src/tdc_crossTalk/ip/xc7a200tfbg676/clk_wiz_0/clk_wiz_0_stub.vhdl
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_out_20 : out STD_LOGIC;
    clk_out_25 : out STD_LOGIC;
    clk_out_30 : out STD_LOGIC;
    clk_out_35 : out STD_LOGIC;
    clk_out_40 : out STD_LOGIC;
    clk_out_45 : out STD_LOGIC;
    clk_out_50 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out_20,clk_out_25,clk_out_30,clk_out_35,clk_out_40,clk_out_45,clk_out_50,reset,locked,clk_in";
begin
end;

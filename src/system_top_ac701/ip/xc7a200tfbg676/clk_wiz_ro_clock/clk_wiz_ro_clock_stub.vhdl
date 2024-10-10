-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Mon Mar  6 17:25:26 2023
-- Host        : caslab-wkst2 running 64-bit Ubuntu 18.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/ip/xc7a200tfbg676/clk_wiz_ro_clock/clk_wiz_ro_clock_stub.vhdl
-- Design      : clk_wiz_ro_clock
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tfbg676-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_ro_clock is
  Port ( 
    clk_out1 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_wiz_ro_clock;

architecture stub of clk_wiz_ro_clock is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,reset,locked,clk_in1";
begin
end;

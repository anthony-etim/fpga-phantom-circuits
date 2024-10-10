set_property PACKAGE_PIN AD12       [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property PACKAGE_PIN AD11       [get_ports sys_clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]

create_clock -period 5.000 -waveform {0.000 2.500} [get_ports sys_clk_p]

# South button
set_property PACKAGE_PIN AB12       [get_ports sys_rst]
set_property IOSTANDARD LVCMOS15    [get_ports sys_rst]

set_property PACKAGE_PIN M19        [get_ports uart_rx]
set_property IOSTANDARD LVCMOS25    [get_ports uart_rx]


set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {heat_gen[*].heat_inst/ro_gen[*].ro/ro*}]

#
# Heater 0
#

create_pblock pblock_heater_0
resize_pblock [get_pblocks pblock_heater_0] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y0}
add_cells_to_pblock [get_pblocks pblock_heater_0] [get_cells {heat_gen[0].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_0]


#
# Heater 1
#

create_pblock pblock_heater_1
resize_pblock [get_pblocks pblock_heater_1] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
add_cells_to_pblock [get_pblocks pblock_heater_1] [get_cells {heat_gen[1].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_1]


#
# Heater 2
#

create_pblock pblock_heater_2
resize_pblock [get_pblocks pblock_heater_2] -add {CLOCKREGION_X0Y1:CLOCKREGION_X0Y1}
add_cells_to_pblock [get_pblocks pblock_heater_2] [get_cells {heat_gen[2].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_2]


#
# Heater 3
#

create_pblock pblock_heater_3
resize_pblock [get_pblocks pblock_heater_3] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
add_cells_to_pblock [get_pblocks pblock_heater_3] [get_cells {heat_gen[3].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_3]


#
# Heater 4
#

create_pblock pblock_heater_4
resize_pblock [get_pblocks pblock_heater_4] -add {CLOCKREGION_X0Y3:CLOCKREGION_X0Y3}
add_cells_to_pblock [get_pblocks pblock_heater_4] [get_cells {heat_gen[4].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_4]


#
# Heater 5
#

create_pblock pblock_heater_5
resize_pblock [get_pblocks pblock_heater_5] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
add_cells_to_pblock [get_pblocks pblock_heater_5] [get_cells {heat_gen[5].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_5]


#
# Heater 6
#

create_pblock pblock_heater_6
resize_pblock [get_pblocks pblock_heater_6] -add {CLOCKREGION_X0Y5:CLOCKREGION_X0Y5}
add_cells_to_pblock [get_pblocks pblock_heater_6] [get_cells {heat_gen[6].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_6]


#
# Heater 7
#

create_pblock pblock_heater_7
resize_pblock [get_pblocks pblock_heater_7] -add {CLOCKREGION_X1Y5:CLOCKREGION_X1Y5}
add_cells_to_pblock [get_pblocks pblock_heater_7] [get_cells {heat_gen[7].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_7]


#
# Heater 8
#

create_pblock pblock_heater_8
resize_pblock [get_pblocks pblock_heater_8] -add {CLOCKREGION_X0Y7:CLOCKREGION_X0Y7}
add_cells_to_pblock [get_pblocks pblock_heater_8] [get_cells {heat_gen[8].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_8]


#
# Heater 9
#

create_pblock pblock_heater_9
resize_pblock [get_pblocks pblock_heater_9] -add {CLOCKREGION_X1Y7:CLOCKREGION_X1Y7}
add_cells_to_pblock [get_pblocks pblock_heater_9] [get_cells {heat_gen[9].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_9]


#
# Heater 10
#

create_pblock pblock_heater_10
resize_pblock [get_pblocks pblock_heater_10] -add {CLOCKREGION_X0Y9:CLOCKREGION_X0Y9}
add_cells_to_pblock [get_pblocks pblock_heater_10] [get_cells {heat_gen[10].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_10]


#
# Heater 11
#

create_pblock pblock_heater_11
resize_pblock [get_pblocks pblock_heater_11] -add {CLOCKREGION_X1Y9:CLOCKREGION_X1Y9}
add_cells_to_pblock [get_pblocks pblock_heater_11] [get_cells {heat_gen[11].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_11]


#
# Heater 12
#

create_pblock pblock_heater_12
resize_pblock [get_pblocks pblock_heater_12] -add {CLOCKREGION_X0Y11:CLOCKREGION_X0Y11}
add_cells_to_pblock [get_pblocks pblock_heater_12] [get_cells {heat_gen[12].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_12]


#
# Heater 13
#

create_pblock pblock_heater_13
resize_pblock [get_pblocks pblock_heater_13] -add {CLOCKREGION_X1Y11:CLOCKREGION_X1Y11}
add_cells_to_pblock [get_pblocks pblock_heater_13] [get_cells {heat_gen[13].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_13]


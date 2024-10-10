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
set_property PACKAGE_PIN K24        [get_ports uart_tx]
set_property IOSTANDARD LVCMOS25    [get_ports uart_tx]

# GPIO SW1-3
set_property PACKAGE_PIN Y28        [get_ports gpio_sw[0]]
set_property IOSTANDARD LVCMOS25    [get_ports gpio_sw[0]]
set_property PACKAGE_PIN AA28       [get_ports gpio_sw[1]]
set_property IOSTANDARD LVCMOS25    [get_ports gpio_sw[1]]
set_property PACKAGE_PIN W29        [get_ports gpio_sw[2]]
set_property IOSTANDARD LVCMOS25    [get_ports gpio_sw[2]]
# set_property PACKAGE_PIN Y29        [get_ports gpio_sw[3]]
# set_property IOSTANDARD LVCMOS25    [get_ports gpio_sw[3]]

set_property PACKAGE_PIN AB8        [get_ports led[0]]
set_property IOSTANDARD LVCMOS15    [get_ports led[0]]
set_property PACKAGE_PIN AA8        [get_ports led[1]]
set_property IOSTANDARD LVCMOS15    [get_ports led[1]]
set_property PACKAGE_PIN AC9        [get_ports led[2]]
set_property IOSTANDARD LVCMOS15    [get_ports led[2]]
set_property PACKAGE_PIN AB9        [get_ports led[3]]
set_property IOSTANDARD LVCMOS15    [get_ports led[3]]
set_property PACKAGE_PIN AE26       [get_ports led[4]]
set_property IOSTANDARD LVCMOS25    [get_ports led[4]]
set_property PACKAGE_PIN G19        [get_ports led[5]]
set_property IOSTANDARD LVCMOS25    [get_ports led[5]]
set_property PACKAGE_PIN E18        [get_ports led[6]]
set_property IOSTANDARD LVCMOS25    [get_ports led[6]]
set_property PACKAGE_PIN F16        [get_ports led[7]]
set_property IOSTANDARD LVCMOS25    [get_ports led[7]]

# set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets *]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets heat_gen[*].heat_inst/ro_gen[*].ro/ro_wire[*]]
set_property ALLOW_COMBINATORIAL_LOOPS TRUE [get_nets {ctrl_gen[*].ctrl_inst/ro_gen[*].cnt_inst/ro/ro*}]

#
# Controller 0
#

create_pblock pblock_ctrl_0
resize_pblock [get_pblocks pblock_ctrl_0] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y0}
add_cells_to_pblock [get_pblocks pblock_ctrl_0] [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_0]

set_property LOC SLICE_X5Y5 [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X9Y10 [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X13Y15 [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X17Y20 [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X21Y25 [get_cells {ctrl_gen[0].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Controller 1
#

create_pblock pblock_ctrl_1
resize_pblock [get_pblocks pblock_ctrl_1] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
add_cells_to_pblock [get_pblocks pblock_ctrl_1] [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_1]

set_property LOC SLICE_X85Y5 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X89Y10 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X93Y15 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X97Y20 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X101Y25 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Controller 2
#

create_pblock pblock_ctrl_2
resize_pblock [get_pblocks pblock_ctrl_2] -add {CLOCKREGION_X0Y6:CLOCKREGION_X0Y6}
add_cells_to_pblock [get_pblocks pblock_ctrl_2] [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_2]

set_property LOC SLICE_X5Y305 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X9Y310 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X13Y315 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X17Y320 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X21Y325 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Controller 3
#

create_pblock pblock_ctrl_3
resize_pblock [get_pblocks pblock_ctrl_3] -add {CLOCKREGION_X1Y6:CLOCKREGION_X1Y6}
add_cells_to_pblock [get_pblocks pblock_ctrl_3] [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_3]

set_property LOC SLICE_X85Y305 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X89Y310 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X93Y315 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X97Y320 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X101Y325 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Heater 0
#

create_pblock pblock_heater_0
resize_pblock [get_pblocks pblock_heater_0] -add {CLOCKREGION_X0Y1:CLOCKREGION_X0Y1}
add_cells_to_pblock [get_pblocks pblock_heater_0] [get_cells {heat_gen[0].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_0]


#
# Heater 1
#

create_pblock pblock_heater_1
resize_pblock [get_pblocks pblock_heater_1] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
add_cells_to_pblock [get_pblocks pblock_heater_1] [get_cells {heat_gen[1].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_1]


#
# Heater 2
#

create_pblock pblock_heater_2
resize_pblock [get_pblocks pblock_heater_2] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
add_cells_to_pblock [get_pblocks pblock_heater_2] [get_cells {heat_gen[2].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_2]


#
# Heater 3
#

create_pblock pblock_heater_3
resize_pblock [get_pblocks pblock_heater_3] -add {CLOCKREGION_X0Y5:CLOCKREGION_X0Y5}
add_cells_to_pblock [get_pblocks pblock_heater_3] [get_cells {heat_gen[3].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_3]


#
# Heater 4
#

create_pblock pblock_heater_4
resize_pblock [get_pblocks pblock_heater_4] -add {CLOCKREGION_X1Y5:CLOCKREGION_X1Y5}
add_cells_to_pblock [get_pblocks pblock_heater_4] [get_cells {heat_gen[4].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_4]


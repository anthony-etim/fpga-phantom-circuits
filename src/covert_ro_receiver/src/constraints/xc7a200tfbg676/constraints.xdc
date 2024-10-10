set_property PACKAGE_PIN R3         [get_ports sys_clk_p]
set_property IOSTANDARD LVDS_25     [get_ports sys_clk_p]
set_property PACKAGE_PIN P3         [get_ports sys_clk_n]
set_property IOSTANDARD LVDS_25     [get_ports sys_clk_n]

create_clock -period 5.000 -waveform {0.000 2.500} [get_ports sys_clk_p]

# South button
set_property PACKAGE_PIN T5         [get_ports sys_rst]
set_property IOSTANDARD SSTL15      [get_ports sys_rst]

set_property PACKAGE_PIN T19        [get_ports uart_rx]
set_property IOSTANDARD LVCMOS18    [get_ports uart_rx]
set_property PACKAGE_PIN U19        [get_ports uart_tx]
set_property IOSTANDARD LVCMOS18    [get_ports uart_tx]

# GPIO SW1-3
set_property PACKAGE_PIN R8         [get_ports gpio_sw[0]]
set_property IOSTANDARD SSTL15      [get_ports gpio_sw[0]]
set_property PACKAGE_PIN P8         [get_ports gpio_sw[1]]
set_property IOSTANDARD SSTL15      [get_ports gpio_sw[1]]
set_property PACKAGE_PIN R7         [get_ports gpio_sw[2]]
set_property IOSTANDARD SSTL15      [get_ports gpio_sw[2]]
# set_property PACKAGE_PIN R6         [get_ports gpio_sw[3]]
# set_property IOSTANDARD SSTL15      [get_ports gpio_sw[3]]

set_property PACKAGE_PIN M26        [get_ports led[0]]
set_property IOSTANDARD LVCMOS33    [get_ports led[0]]
set_property PACKAGE_PIN T24        [get_ports led[1]]
set_property IOSTANDARD LVCMOS33    [get_ports led[1]]
set_property PACKAGE_PIN T25        [get_ports led[2]]
set_property IOSTANDARD LVCMOS33    [get_ports led[2]]
set_property PACKAGE_PIN R26        [get_ports led[3]]
set_property IOSTANDARD LVCMOS33    [get_ports led[3]]

# HACK! connect to PMOD
set_property PACKAGE_PIN P26        [get_ports led[4]]
set_property IOSTANDARD LVCMOS33    [get_ports led[4]]
set_property PACKAGE_PIN T22        [get_ports led[5]]
set_property IOSTANDARD LVCMOS33    [get_ports led[5]]
set_property PACKAGE_PIN R22        [get_ports led[6]]
set_property IOSTANDARD LVCMOS33    [get_ports led[6]]
set_property PACKAGE_PIN T23        [get_ports led[7]]
set_property IOSTANDARD LVCMOS33    [get_ports led[7]]

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

set_property LOC SLICE_X120Y5 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X124Y10 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X128Y15 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X132Y20 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X136Y25 [get_cells {ctrl_gen[1].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Controller 2
#

create_pblock pblock_ctrl_2
resize_pblock [get_pblocks pblock_ctrl_2] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
add_cells_to_pblock [get_pblocks pblock_ctrl_2] [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_2]

set_property LOC SLICE_X5Y205 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X9Y210 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X13Y215 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X17Y220 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X21Y225 [get_cells {ctrl_gen[2].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


#
# Controller 3
#

create_pblock pblock_ctrl_3
resize_pblock [get_pblocks pblock_ctrl_3] -add {CLOCKREGION_X1Y4:CLOCKREGION_X1Y4}
add_cells_to_pblock [get_pblocks pblock_ctrl_3] [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[*].cnt_inst/ro/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_ctrl_3]

set_property LOC SLICE_X120Y205 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[0].cnt_inst/ro/ro*}]
set_property LOC SLICE_X124Y210 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[1].cnt_inst/ro/ro*}]
set_property LOC SLICE_X128Y215 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[2].cnt_inst/ro/ro*}]
set_property LOC SLICE_X132Y220 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[3].cnt_inst/ro/ro*}]
set_property LOC SLICE_X136Y225 [get_cells {ctrl_gen[3].ctrl_inst/ro_gen[4].cnt_inst/ro/ro*}]


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
resize_pblock [get_pblocks pblock_heater_2] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}
add_cells_to_pblock [get_pblocks pblock_heater_2] [get_cells {heat_gen[2].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_2]


#
# Heater 3
#

create_pblock pblock_heater_3
resize_pblock [get_pblocks pblock_heater_3] -add {CLOCKREGION_X0Y3:CLOCKREGION_X0Y3}
add_cells_to_pblock [get_pblocks pblock_heater_3] [get_cells {heat_gen[3].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_3]


#
# Heater 4
#

create_pblock pblock_heater_4
resize_pblock [get_pblocks pblock_heater_4] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
add_cells_to_pblock [get_pblocks pblock_heater_4] [get_cells {heat_gen[4].heat_inst/*}]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_heater_4]


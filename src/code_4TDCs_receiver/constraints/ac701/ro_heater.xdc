

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets *]


# RO heater
# create_pblock Pblock_ro_heater
# resize_pblock [get_pblocks Pblock_ro_heater] -add {SLICE_X50Y90:SLICE_X110Y140}
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[0].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[1].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[2].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[3].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[4].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[5].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[6].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[7].heater_inst/*}]
# set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater]
# set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater]

# Other TDC Logic
# create_pblock Pblock_tdc_logic
# resize_pblock [get_pblocks Pblock_tdc_logic] -add {SLICE_X77Y120:SLICE_X90Y140}
# # add_cells_to_pblock [get_pblocks Pblock_tdc_logic] [get_cells {RO_GEATER_GEN[*]/*}]
# # add_cells_to_pblock [get_pblocks Pblock_tdc_logic] [get_cells {GEN_TDC[*]/*}]
# add_cells_to_pblock [get_pblocks Pblock_tdc_logic] [get_cells {rx_uart/*}]
# add_cells_to_pblock [get_pblocks Pblock_tdc_logic] [get_cells {tx_uart/*}]
# # set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_tdc_logic]
# set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_tdc_logic]

# RO heater_0
create_pblock Pblock_ro_heater_0
# resize_pblock [get_pblocks Pblock_ro_heater_0] -add {SLICE_X26Y200:SLICE_X34Y239}
resize_pblock [get_pblocks Pblock_ro_heater_0] -add {CLOCKREGION_X0Y1:CLOCKREGION_X0Y1}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_0] [get_cells {RO_GEATER_GEN[0].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater_0] [get_cells {RO_GEATER_GEN[1].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_0]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_0]

# RO heater_1
create_pblock Pblock_ro_heater_1
# resize_pblock [get_pblocks Pblock_ro_heater_1] -add {SLICE_X125Y200:SLICE_X133Y239}
resize_pblock [get_pblocks Pblock_ro_heater_1] -add {CLOCKREGION_X1Y1:CLOCKREGION_X1Y1}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_1] [get_cells {RO_GEATER_GEN[1].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater_1] [get_cells {RO_GEATER_GEN[3].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_1]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_1]

# RO heater_2
create_pblock Pblock_ro_heater_2
# resize_pblock [get_pblocks Pblock_ro_heater_2] -add {SLICE_X26Y10:SLICE_X34Y59}
resize_pblock [get_pblocks Pblock_ro_heater_2] -add {CLOCKREGION_X0Y3:CLOCKREGION_X0Y3}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_2] [get_cells {RO_GEATER_GEN[2].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater_2] [get_cells {RO_GEATER_GEN[5].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_2]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_2]

# RO heater_3
create_pblock Pblock_ro_heater_3
# resize_pblock [get_pblocks Pblock_ro_heater_3] -add {SLICE_X125Y10:SLICE_X133Y59}
resize_pblock [get_pblocks Pblock_ro_heater_3] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_3] [get_cells {RO_GEATER_GEN[3].heater_inst/*}]
# add_cells_to_pblock [get_pblocks Pblock_ro_heater_3] [get_cells {RO_GEATER_GEN[7].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_3]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_3]

# RO heater_4
create_pblock Pblock_ro_heater_4
resize_pblock [get_pblocks Pblock_ro_heater_4] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_4] [get_cells {RO_GEATER_GEN[4].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_4]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_4]

# # RO heater_empty
# create_pblock Pblock_ro_heater_empty
# resize_pblock [get_pblocks Pblock_ro_heater_empty] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}
# set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_empty]
# set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_empty]
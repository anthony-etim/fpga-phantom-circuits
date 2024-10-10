

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets *]


# RO heater
create_pblock Pblock_ro_heater
resize_pblock [get_pblocks Pblock_ro_heater] -add {SLICE_X50Y90:SLICE_X110Y140}
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[0].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[1].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[2].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[3].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[4].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[5].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[6].heater_inst/*}]
add_cells_to_pblock [get_pblocks Pblock_ro_heater] [get_cells {RO_GEATER_GEN[7].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater]


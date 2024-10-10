

##################################
# Some settings
##################################

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets *]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_0/*]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_1/*]

# ##################################
# # Only sensors in the clock region
# ##################################


create_pblock pblock_tx_rx
resize_pblock [get_pblocks pblock_tx_rx] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
add_cells_to_pblock [get_pblocks pblock_tx_rx] [get_cells {simple_transmitter_INST/*}]
add_cells_to_pblock [get_pblocks pblock_tx_rx] [get_cells {phantum_DUT/ro_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks pblock_tx_rx]
set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_tx_rx]


##################################
# Long wires 
##################################

# transmitter tx 1
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart}]
set_property LOC SLICE_X144Y3 [get_cells {simple_transmitter_INST/txWireStart}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOC SLICE_X144Y35 [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire}]
# receiver RO 1
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property LOC SLICE_X144Y4 [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOC SLICE_X144Y36 [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[2]}]
# transmitter tx 2
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property LOC SLICE_X144Y5 [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOC SLICE_X144Y37 [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_second}]
# receiver RO 2
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[2].ro_buf}]
set_property LOC SLICE_X144Y6 [get_cells {phantum_DUT/ro_INST/ro_stages[2].ro_buf}]
set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
set_property LOC SLICE_X144Y38 [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[4]}]
# transmitter tx 3
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_third}]
set_property LOC SLICE_X144Y7 [get_cells {simple_transmitter_INST/txWireStart_third}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property LOC SLICE_X144Y39 [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_third}]
# receiver RO 3
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[4].ro_buf}]
set_property LOC SLICE_X144Y8 [get_cells {phantum_DUT/ro_INST/ro_stages[4].ro_buf}]
set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
set_property LOC SLICE_X144Y40 [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[6]}]
# transmitter tx 4
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fourth}]
set_property LOC SLICE_X144Y9 [get_cells {simple_transmitter_INST/txWireStart_fourth}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property LOC SLICE_X144Y41 [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fourth}]
# transmitter tx 5
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fifth}]
set_property LOC SLICE_X144Y10 [get_cells {simple_transmitter_INST/txWireStart_fifth}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
set_property LOC SLICE_X144Y42 [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fifth}]







# # transmitter tx 3
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property LOC SLICE_X144Y2 [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOC SLICE_X144Y34 [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_third}]
# # transmitter tx 1
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart}]
# set_property LOC SLICE_X144Y3 [get_cells {simple_transmitter_INST/txWireStart}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property LOC SLICE_X144Y35 [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire}]
# # receiver RO 0
# set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
# set_property LOC SLICE_X144Y4 [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
# set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property LOC SLICE_X144Y36 [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[2]}]
# # transmitter tx 2
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_second}]
# set_property LOC SLICE_X144Y5 [get_cells {simple_transmitter_INST/txWireStart_second}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property LOC SLICE_X144Y37 [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_second}]
# # transmitter tx 4
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fourth}]
# set_property LOC SLICE_X144Y6 [get_cells {simple_transmitter_INST/txWireStart_fourth}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property LOC SLICE_X144Y38 [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fourth}]






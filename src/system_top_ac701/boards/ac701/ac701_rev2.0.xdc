##################################
# Top wires
##################################
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVDS_25} [get_ports clk_p]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVDS_25} [get_ports clk_n]
# 200 MHz
create_clock -period 5.000 -name clk -waveform {0.000 2.500} -add [get_ports clk_p] 

set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS18} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS18} [get_ports uart_tx]


##################################
# Some settings
##################################

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets *]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets GEN_RO_HEATER_SENSOR[*].ro_sensor_INST/ro_wire[*]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets phantum_DUT/ro_INST/ro_wire[*]]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets phantum_DUT/ro_heater_DUT/heater_gen[*].heater_inst/ro_gen[*].ro/ro_wire[*]]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets phantum_DUT/*]

# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_0/*]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_1/*]

# ##################################
# # Only sensors in the clock region
# ##################################


# create_pblock pblock_tx_rx
# resize_pblock [get_pblocks pblock_tx_rx] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y0}
# add_cells_to_pblock [get_pblocks pblock_tx_rx] [get_cells {simple_transmitter_INST/*}]
# add_cells_to_pblock [get_pblocks pblock_tx_rx] [get_cells {phantum_DUT/ro_INST/*}]
# set_property EXCLUDE_PLACEMENT TRUE [get_pblocks pblock_tx_rx]
# set_property CONTAIN_ROUTING TRUE [get_pblocks pblock_tx_rx]


##################################
# Long wires 
##################################

# transmitter tx 1
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart}]
set_property LOC SLICE_X144Y7 [get_cells {simple_transmitter_INST/txWireStart}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOC SLICE_X144Y90 [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire}]
# receiver RO 1
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property LOC SLICE_X144Y8 [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOC SLICE_X144Y92 [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[2]}]
# transmitter tx 2
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property LOC SLICE_X144Y9 [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOC SLICE_X144Y94 [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_second}]

# Creating pblock for ro and tx wires
create_pblock Pblock_phantom_wires
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {simple_transmitter_INST/txWireStart}]
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {simple_transmitter_INST/txWireEnd}]
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {simple_transmitter_INST/txWireStart_second}]
add_cells_to_pblock [get_pblocks Pblock_phantom_wires] [get_cells {simple_transmitter_INST/txWireEnd_second}]
# resize_pblock [get_pblocks Pblock_phantom_wires] -add {SLICE_X115Y0:SLICE_X160Y90} 
resize_pblock [get_pblocks Pblock_phantom_wires] -add {CLOCKREGION_X1Y0:CLOCKREGION_X1Y1} 
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_phantom_wires]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_phantom_wires]

# ********************* RO Sensors ***********************
#
# Sensor 0
#
# Modify the following items for your code:
#   1. `CLOCKREGION_X0Y4`
#       => Your custom clock region
#   2. `PATH_TO_ro*`
#       => The path to your RO sensor's ro
#   3. `set_property LOC XXX` 
#       => Choose your own location
#

# phantom circuits p block
# create_pblock Pblock_phantom
# # resize_pblock [get_pblocks Pblock_phantom] -add {SLICE_X0Y0:SLICE_X83Y119}
# # resize_pblock [get_pblocks Pblock_phantom] -add {SLICE_X10Y120:SLICE_X153Y179}
# resize_pblock [get_pblocks Pblock_phantom_wires] -add {CLOCKREGION_X0Y0:CLOCKREGION_X0Y0} 
# add_cells_to_pblock [get_pblocks Pblock_phantom] [get_cells {phantum_DUT/*}]
# set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_phantom]
# set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_phantom]

# ro heater sensor zero p block
create_pblock Pblock_ro_heater_sensor_zero
# resize_pblock [get_pblocks Pblock_ro_heater_sensor_one] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
resize_pblock [get_pblocks Pblock_ro_heater_sensor_zero] -add {SLICE_X1Y249:SLICE_X7Y249}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_sensor_zero] [get_cells {GEN_RO_HEATER_SENSOR[0].ro_sensor_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_sensor_zero]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_sensor_zero]
# set_property LOC SLICE_X1Y249 [get_cells {ro_sensor_INST/*}]

# ro heater sensor one p block
create_pblock Pblock_ro_heater_sensor_one
# resize_pblock [get_pblocks Pblock_ro_heater_sensor_one] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
resize_pblock [get_pblocks Pblock_ro_heater_sensor_one] -add {SLICE_X0Y199:SLICE_X7Y199}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_sensor_one] [get_cells {GEN_RO_HEATER_SENSOR[1].ro_sensor_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_sensor_one]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_sensor_one]
# set_property LOC SLICE_X1Y249 [get_cells {ro_sensor_INST/*}]

# ro heater sensor two p block
create_pblock Pblock_ro_heater_sensor_two
# resize_pblock [get_pblocks Pblock_ro_heater_sensor_one] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
resize_pblock [get_pblocks Pblock_ro_heater_sensor_two] -add {SLICE_X0Y149:SLICE_X7Y149}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_sensor_two] [get_cells {GEN_RO_HEATER_SENSOR[2].ro_sensor_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_sensor_two]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_sensor_two]
# set_property LOC SLICE_X1Y249 [get_cells {ro_sensor_INST/*}]

# ro heater sensor three p block
create_pblock Pblock_ro_heater_sensor_three
# resize_pblock [get_pblocks Pblock_ro_heater_sensor_one] -add {CLOCKREGION_X0Y4:CLOCKREGION_X0Y4}
resize_pblock [get_pblocks Pblock_ro_heater_sensor_three] -add {SLICE_X0Y101:SLICE_X7Y101}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_sensor_three] [get_cells {GEN_RO_HEATER_SENSOR[3].ro_sensor_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_sensor_three]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_sensor_three]
# set_property LOC SLICE_X1Y249 [get_cells {ro_sensor_INST/*}]

# ro clock p block
create_pblock Pblock_ro_clock
resize_pblock [get_pblocks Pblock_ro_clock] -add {SLICE_X114Y249:SLICE_X117Y249}
add_cells_to_pblock [get_pblocks Pblock_ro_clock] [get_cells {ro_clock_INST/ring_oscillator_INST/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_clock]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_clock]
# set_property LOC SLICE_X1Y249 [get_cells {ro_sensor_INST/*}]

# RO heater_0
create_pblock Pblock_ro_heater_0
resize_pblock [get_pblocks Pblock_ro_heater_0] -add {CLOCKREGION_X0Y1:CLOCKREGION_X0Y1}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_0] [get_cells {phantum_DUT/ro_heater_DUT/heater_gen[0].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_0]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_0]

# RO heater_1
create_pblock Pblock_ro_heater_1
resize_pblock [get_pblocks Pblock_ro_heater_1] -add {CLOCKREGION_X0Y2:CLOCKREGION_X0Y2}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_1] [get_cells {phantum_DUT/ro_heater_DUT/heater_gen[1].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_1]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_1]

# RO heater_2
create_pblock Pblock_ro_heater_2
resize_pblock [get_pblocks Pblock_ro_heater_2] -add {CLOCKREGION_X1Y2:CLOCKREGION_X1Y2}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_2] [get_cells {phantum_DUT/ro_heater_DUT/heater_gen[2].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_2]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_2]

# RO heater_3
create_pblock Pblock_ro_heater_3
resize_pblock [get_pblocks Pblock_ro_heater_3] -add {CLOCKREGION_X0Y3:CLOCKREGION_X0Y3}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_3] [get_cells {phantum_DUT/ro_heater_DUT/heater_gen[3].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_3]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_3]

# RO heater_4
create_pblock Pblock_ro_heater_4
resize_pblock [get_pblocks Pblock_ro_heater_4] -add {CLOCKREGION_X1Y3:CLOCKREGION_X1Y3}
add_cells_to_pblock [get_pblocks Pblock_ro_heater_4] [get_cells {phantum_DUT/ro_heater_DUT/heater_gen[4].heater_inst/*}]
set_property EXCLUDE_PLACEMENT TRUE [get_pblocks Pblock_ro_heater_4]
set_property CONTAIN_ROUTING TRUE [get_pblocks Pblock_ro_heater_4]


# # transmitter tx 3
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property LOC SLICE_X144Y6 [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOC SLICE_X144Y62 [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_third}]



# # receiver RO 2
# set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[2].ro_buf}]
# set_property LOC SLICE_X144Y6 [get_cells {phantum_DUT/ro_INST/ro_stages[2].ro_buf}]
# set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
# set_property LOC SLICE_X144Y38 [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
# set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[3].ro_buf}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[4]}]
# # transmitter tx 3
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property LOC SLICE_X144Y7 [get_cells {simple_transmitter_INST/txWireStart_third}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOC SLICE_X144Y39 [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_third}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_third}]
# # receiver RO 3
# set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[4].ro_buf}]
# set_property LOC SLICE_X144Y8 [get_cells {phantum_DUT/ro_INST/ro_stages[4].ro_buf}]
# set_property BEL A6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
# set_property LOC SLICE_X144Y40 [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
# set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[5].ro_buf}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/ro_INST/ro_wire[6]}]
# # transmitter tx 4
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fourth}]
# set_property LOC SLICE_X144Y9 [get_cells {simple_transmitter_INST/txWireStart_fourth}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property LOC SLICE_X144Y41 [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fourth}]
# # transmitter tx 5
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fifth}]
# set_property LOC SLICE_X144Y10 [get_cells {simple_transmitter_INST/txWireStart_fifth}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
# set_property LOC SLICE_X144Y42 [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fifth}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fifth}]








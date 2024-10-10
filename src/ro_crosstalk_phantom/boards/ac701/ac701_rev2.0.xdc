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
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_0/*]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_1/*]

##################################
# Long wires 
##################################

# # transmitter tx 1
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart}]
# set_property LOC SLICE_X144Y6 [get_cells {simple_transmitter_INST/txWireStart}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property LOC SLICE_X144Y38 [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire}]
# # receiver RO 0
# set_property BEL D6LUT [get_cells {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_stages[0].ro_buf}]
# set_property LOC SLICE_X144Y7 [get_cells {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_stages[0].ro_buf}]
# set_property BEL A6LUT [get_cells {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property LOC SLICE_X144Y39 [get_cells {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_INST/ro_wire[2]}]
# # transmitter tx 2
# set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_second}]
# set_property LOC SLICE_X144Y8 [get_cells {simple_transmitter_INST/txWireStart_second}]
# set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property LOC SLICE_X144Y40 [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_second}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_second}]

# transmitter tx 3
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_third}]
set_property LOC SLICE_X144Y3 [get_cells {simple_transmitter_INST/txWireStart_third}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property LOC SLICE_X144Y35 [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_third}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_third}]
# receiver RO 1
set_property BEL D6LUT [get_cells {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property LOC SLICE_X144Y4 [get_cells {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property BEL A6LUT [get_cells {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOC SLICE_X144Y36 [get_cells {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_INST/ro_wire[2]}]
# transmitter tx 4
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_fourth}]
set_property LOC SLICE_X144Y5 [get_cells {simple_transmitter_INST/txWireStart_fourth}]
set_property BEL A6LUT [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property LOC SLICE_X144Y37 [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_fourth}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {simple_transmitter_INST/tx_wire_fourth}]








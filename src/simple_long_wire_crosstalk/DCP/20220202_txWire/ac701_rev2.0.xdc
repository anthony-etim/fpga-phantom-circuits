set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVDS_25} [get_ports clk_p]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVDS_25} [get_ports clk_n]

create_clock -period 5.000 -name clk -waveform {0.000 2.500} -add [get_ports clk_p] # 200 MHz

set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS18} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS18} [get_ports uart_tx]


#set_property BEL C5LUT [get_cells receiver_INST/ring_oscillator_INST/ro_stages[4].ro_buf]
#set_property BEL C5LUT [get_cells receiver_INST/ring_oscillator_INST/ro_stages[3].ro_buf]
set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets receiver_INST/ring_oscillator_INST/*]

# set_property LOCK_PINS {I0:A2} get_cells {receiver_INST/ring_oscillator_INST/ro_stages[4].ro_buf}
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {receiver_INST/ring_oscillator_INST/ro_wire[5]}]

# User Generated physical constraints 

# set_property BEL D6LUT [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[3].ro_buf}]
# set_property LOC SLICE_X24Y0 [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[3].ro_buf}]
# set_property BEL A6LUT [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[4].ro_buf}]
# set_property LOC SLICE_X24Y49 [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[4].ro_buf}]
# set_property BEL A6LUT [get_cells {transmitter_INST/txData[0]_i_1}]
# set_property LOC SLICE_X25Y49 [get_cells {transmitter_INST/txData[0]_i_1}]
# set_property BEL B5FF [get_cells {transmitter_INST/txData_reg[0]}]
# set_property LOC SLICE_X24Y1 [get_cells {transmitter_INST/txData_reg[0]}]

# User Generated miscellaneous constraints 

# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets receiver_INST/ring_oscillator_INST/*]

# set_property LOCK_PINS {I0:A2} get_cells {receiver_INST/ring_oscillator_INST/ro_stages[4].ro_buf}
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {receiver_INST/ring_oscillator_INST/ro_wire[5]}]

set_property BEL D6LUT [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[0].ro_buf}]
set_property LOC SLICE_X144Y4 [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[0].ro_buf}]
set_property BEL A6LUT [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[1].ro_buf}]
set_property LOC SLICE_X144Y36 [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[1].ro_buf}]
# set_property LOC SLICE_X144Y28 [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[1].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {receiver_INST/ring_oscillator_INST/ro_stages[1].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {receiver_INST/ring_oscillator_INST/ro_wire[2]}]


set_property BEL D6LUT [get_cells {transmitter_INST/txWireStart}]
set_property LOC SLICE_X144Y5 [get_cells {transmitter_INST/txWireStart}]
set_property BEL A6LUT [get_cells {transmitter_INST/txWireEnd}]
set_property LOC SLICE_X144Y37 [get_cells {transmitter_INST/txWireEnd}]
# set_property LOC SLICE_X144Y29 [get_cells {transmitter_INST/txWireEnd}]
set_property LOCK_PINS {I0:A2} [get_cells {transmitter_INST/txWireEnd}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {transmitter_INST/tx_wire}]

 


# set_property BEL D6LUT [get_cells {transmitter_INST/txWireEnd}]
# set_property LOC SLICE_X144Y5 [get_cells {transmitter_INST/txWireEnd}]
# set_property BEL A6LUT [get_cells {transmitter_INST/txWireStart}]
# set_property LOC SLICE_X144Y37 [get_cells {transmitter_INST/txWireStart}]
# # set_property LOC SLICE_X144Y29 [get_cells {transmitter_INST/txWireStart}]
# set_property LOCK_PINS {I0:A2} [get_cells {transmitter_INST/txWireStart}]
# set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 NR1BEG3 LVB_L0 LVB_L0 NN6BEG2 NL1BEG1 IMUX_L2 CLBLM_M_A2} [get_nets {transmitter_INST/tx_wire}]

 
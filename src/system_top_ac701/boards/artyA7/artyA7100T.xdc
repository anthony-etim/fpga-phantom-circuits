##################################
# Top wires
##################################
# Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk_100 }]; #IO_L12P_T1_MRCC_35 Sch=gclk[100]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_100 }];

# USB-UART Interface
# set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { uart_rx }]; #IO_L19N_T3_VREF_16 Sch=uart_rxd_out
# set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { uart_tx }]; #IO_L14N_T2_SRCC_16 Sch=uart_txd_in

set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { uart_tx }]; #IO_L19N_T3_VREF_16 Sch=uart_rxd_out
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { uart_rx }]; #IO_L14N_T2_SRCC_16 Sch=uart_txd_in



##################################
# Some settings
##################################

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets *]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_0/*]
# set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets tx_ro_INST_1/*]

##################################
# Only sensors in the clock region
##################################


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
set_property LOC SLICE_X60Y4 [get_cells {simple_transmitter_INST/txWireStart}]
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOC SLICE_X60Y46 [get_cells {simple_transmitter_INST/txWireEnd}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 WR1BEG_S0 LV_L0 LV_L0 NN6BEG3 EL1BEG2 SL1BEG2 IMUX45 CLBLM_M_D2} [get_nets {simple_transmitter_INST/tx_wire}]
# receiver RO 0
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property LOC SLICE_X60Y5 [get_cells {phantum_DUT/ro_INST/ro_stages[0].ro_buf}]
set_property BEL D6LUT [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOC SLICE_X60Y47 [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property LOCK_PINS {I0:A2} [get_cells {phantum_DUT/ro_INST/ro_stages[1].ro_buf}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 WR1BEG_S0 LV_L0 LV_L0 NN6BEG3 EL1BEG2 SL1BEG2 IMUX45 CLBLM_M_D2} [get_nets {phantum_DUT/ro_INST/ro_wire[2]}]
# transmitter tx 2
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property LOC SLICE_X60Y6 [get_cells {simple_transmitter_INST/txWireStart_second}]
set_property BEL D6LUT [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOC SLICE_X60Y48 [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property LOCK_PINS {I0:A2} [get_cells {simple_transmitter_INST/txWireEnd_second}]
set_property FIXED_ROUTE {CLBLM_M_D CLBLM_LOGIC_OUTS15 WR1BEG_S0 LV_L0 LV_L0 NN6BEG3 EL1BEG2 SL1BEG2 IMUX45 CLBLM_M_D2} [get_nets {simple_transmitter_INST/tx_wire_second}]






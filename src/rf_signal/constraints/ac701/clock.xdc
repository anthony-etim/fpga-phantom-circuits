##################################
# Top wires
##################################
set_property -dict {PACKAGE_PIN R3 IOSTANDARD LVDS_25} [get_ports clk_p]
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVDS_25} [get_ports clk_n]
# 200 MHz
create_clock -period 5.000 -name clk -waveform {0.000 2.500} -add [get_ports clk_p]

set_property -dict {PACKAGE_PIN T19 IOSTANDARD LVCMOS18} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN U19 IOSTANDARD LVCMOS18} [get_ports uart_tx]

set_property ALLOW_COMBINATORIAL_LOOPS TRUE
set_property SEVERITY {Warning} [get_drc_checks LUTLP-1]


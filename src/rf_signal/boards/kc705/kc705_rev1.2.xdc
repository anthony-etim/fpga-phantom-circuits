set_property -dict {PACKAGE_PIN AD12 IOSTANDARD DIFF_SSTL15} [get_ports clk_p]
set_property -dict {PACKAGE_PIN AD11 IOSTANDARD DIFF_SSTL15} [get_ports clk_n]

# 200 MHz
create_clock -period 5.000 -name clk -waveform {0.000 2.500} -add [get_ports clk_p]

set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS25} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN K24 IOSTANDARD LVCMOS25} [get_ports uart_tx]

set_property -dict {PACKAGE_PIN BA34 IOSTANDARD DIFF_SSTL12} [get_ports clk_p]
set_property -dict {PACKAGE_PIN BB34 IOSTANDARD DIFF_SSTL12} [get_ports clk_n]

# 300 MHz
create_clock -period 3.333 -name clk -waveform {0.000 1.667} -add [get_ports clk_p]

set_property -dict {PACKAGE_PIN BF20 IOSTANDARD LVCMOS18} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN BF24 IOSTANDARD LVCMOS18} [get_ports uart_tx]

# Differential pair clock pins
set_property -dict {PACKAGE_PIN AY37 IOSTANDARD DIFF_SSTL12} [get_ports clk_p]
set_property -dict {PACKAGE_PIN AY38 IOSTANDARD DIFF_SSTL12} [get_ports clk_n]

# Clock pin's clock period, here 3.333 ns = 300 MHz, need to set for one of the clock pins
create_clock -period 3.333 -name clk -waveform {0.000 1.667} -add [get_ports clk_p]

# UART receive and transmit pins
set_property -dict {PACKAGE_PIN BF18 IOSTANDARD LVCMOS12} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN BB20 IOSTANDARD LVCMOS12} [get_ports uart_tx]

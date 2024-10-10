set_property -dict {PACKAGE_PIN G17 IOSTANDARD LVDS DQS_BIAS TRUE} [get_ports clk_p]
set_property -dict {PACKAGE_PIN G16 IOSTANDARD LVDS} [get_ports clk_n]

# 100 MHz
create_clock -period 10.000 -name clk -waveform {0.000 5.000} -add [get_ports clk_p]

set_property -dict {PACKAGE_PIN BF26 IOSTANDARD LVCMOS18} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN BE26 IOSTANDARD LVCMOS18} [get_ports uart_tx]

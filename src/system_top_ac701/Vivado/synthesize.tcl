set fileName [lindex $argv 0]

catch {set fptr [open $fileName r]} ;
set contents [read -nonewline $fptr] ;
close $fptr ;

set splitCont [split $contents "\n"] ;
foreach f $splitCont {
  puts $f
  read_verilog $f
}

set top_module [lindex $argv 1]
set partname [lindex $argv 2]
set xdcfile  [lindex $argv 3]
set board [lindex $argv 4]
# print out messages
puts "top_module $top_module" 
puts "partname $partname"
puts "xdcfile $xdcfile"
puts "board $board"

set_part $partname
set_param general.maxThreads 8

# # clock ip
# set ip_dir  $ipDir
# set ip_clk_xci "$ip_dir/clk_wiz_0/clk_wiz_0.xci"
# add_files $ip_clk_xci
# read_ip $ip_clk_xci
# synth_ip [get_ips clk_wiz_0]
# get_files -compile_order sources -used_in synthesis
# # end clock ip

# ro clock ip
set ip_dir  "../ip/$partname"
set ip_clk_xci "$ip_dir/clk_wiz_ro_clock/clk_wiz_ro_clock.xci"
add_files $ip_clk_xci
read_ip $ip_clk_xci
synth_ip [get_ips clk_wiz_ro_clock]
get_files -compile_order sources -used_in synthesis
# end clock ip

# FIFO ip
set ip_dir  "../ip/$partname"
set ip_fifo_xci "$ip_dir/fifo_generator_0/fifo_generator_0.xci"
add_files $ip_fifo_xci
read_ip $ip_fifo_xci
synth_ip [get_ips fifo_generator_0]
get_files -compile_order sources -used_in synthesis
# end FIFO ip

update_compile_order -fileset sources_1

synth_design -part $partname -top $top_module

read_xdc $xdcfile

opt_design

place_design

route_design

report_utilization
report_utilization -hierarchical -hierarchical_depth 2
report_timing
report_power

puts "Writing DCP"

write_checkpoint -force ../build/${board}/synth_system.dcp


puts "Writing bitstream"

write_verilog -force ../build/${board}/synth_system.v
write_bitstream -force ../build/${board}/synth_system.bit
write_debug_probes -force ../build/${board}/debugcore.ltx

puts "Done synthesizing"

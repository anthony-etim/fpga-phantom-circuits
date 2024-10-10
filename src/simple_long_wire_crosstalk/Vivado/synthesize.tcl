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

set_part $partname
set_param general.maxThreads 8
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

puts "Done synthesizing"

set part        [lindex $argv 0]
if {[string trim $part] == ""} {
    puts "Empty part no!"
    exit 2
} 

set top         covert_receiver_top
set script_path [file dirname [info script]]
set src_dir     [file normalize $script_path/../src]
set build_dir   [file normalize $script_path/binaries/$part]
set gen_dir     $build_dir/inputs
set check_dir   $build_dir/checkpoints
set report_dir  $build_dir/reports

file mkdir $check_dir $report_dir

set ip_dir      $src_dir/ip/$part
set constr_dir  $src_dir/constraints/$part


create_project -in memory
set_property part $part [current_project]

if {![catch "glob \"$src_dir/*.v\"" s]} {
    puts "Common Verilog sources: $s"
    read_verilog $s
}

if {![catch "glob \"$src_dir/*.{sv,vh}\"" s]} {
    puts "Common System Verilog sources: $s"
    read_verilog -sv $s
}

if {![catch "glob \"$ip_dir/*/*.xci\"" s]} {
    puts "IPs: $s"
    foreach ip $s {
        read_ip $ip
        upgrade_ip [get_ips [file tail [file dirname $ip]]]
        set_property is_locked false [get_files $ip]
        generate_target all [get_files $ip]
        # export_ip_user_files -of_objects [get_files $ip] -no_script -sync -force -quiet
   }
}

if {![catch "glob \"$constr_dir/*.xdc\"" s]} {
   puts "XDCs: $s"
   read_xdc $s
}

synth_design -top $top -part $part -flatten_hierarchy none -directive RuntimeOptimized

write_checkpoint -force $check_dir/$top\_synth.dcp
report_timing_summary -file $report_dir/post_synth_timing_summary.rpt
report_utilization -file $report_dir/post_synth_util.rpt

opt_design
write_checkpoint -force $check_dir/$top\_opt.dcp
report_timing_summary -file $report_dir/post_opt_timing_summary.rpt
report_utilization -file $report_dir/post_opt_util.rpt

place_design
write_checkpoint -force $check_dir/$top\_place.dcp
report_timing_summary -file $report_dir/post_place_timing_summary.rpt
report_utilization -file $report_dir/post_place_util.rpt

report_clock_utilization -file $report_dir/post_place_clock_util.rpt
set slack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
if {$slack < 0} {
    puts "Negative slack: $slack. Running physical optimization"
    phys_opt_design
    write_checkpoint -force $check_dir/$top\_phys_opt.dcp
    report_timing_summary -file $report_dir/post_phys_opt_timing_summary.rpt
    report_utilization -file $report_dir/post_phys_opt_util.rpt
}

report_drc -file $report_dir/post_place_drc.rpt

route_design
write_checkpoint -force $check_dir/$top\_route.dcp
report_timing_summary -file $report_dir/post_route_timing_summary.rpt
report_utilization -file $report_dir/post_route_util.rpt
report_route_status -file $report_dir/post_route_status.rpt
report_power -file $report_dir/post_route_power.rpt
report_drc -file $report_dir/post_route_drc.rpt

report_clock_utilization -file $report_dir/post_route_clock_util.rpt
set slack [get_property SLACK [get_timing_paths -max_paths 1 -nworst 1 -setup]]
if {[string trim $slack] != "" && $slack < 0} {
    puts "ERROR: Negative slack: $slack!"
} else {
    write_bitstream -force $build_dir/$top.bit
}

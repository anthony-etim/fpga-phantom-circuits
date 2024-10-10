set bitfile [lindex $argv 0]
if {[string trim $bitfile] == ""} {
    puts "Empty bitfile!"
    exit 2
}

set serial [lindex $argv 1]
if {[string trim $serial] == ""} {
    set serial *
}

puts "$bitfile -> $serial"

open_hw
connect_hw_server
refresh_hw_server
current_hw_target [get_hw_targets */xilinx_tcf/Digilent/$serial]
open_hw_target
set device [lindex [get_hw_devices] end]
set_property PROGRAM.FILE $bitfile $device
set_param xicom.use_bitstream_version_check false

current_hw_device $device
refresh_hw_device -update_hw_probes false $device

program_hw_devices $device
close_hw

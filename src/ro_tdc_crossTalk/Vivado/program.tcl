set device  [lindex $argv 0]
set serial  [lindex $argv 1]
set bitfile [lindex $argv 2]

puts "device:   $device"
puts "serial:   $serial"
puts "bitfile:  $bitfile"

open_hw

connect_hw_server

refresh_hw_server

# puts [get_hw_targets *]
# exit

current_hw_target [get_hw_targets */xilinx_tcf/$serial]

open_hw_target

foreach d [get_hw_devices] {
  puts "found device: $d"
  if { [string match $device* $d] } { 
    set dev $d
    break
  }
}

#exit

set_property PROGRAM.FILE $bitfile [get_hw_devices $dev]
#set_property PROBES.FILE {} [get_hw_devices $dev]
#set_property FULL_PROBES.FILE {} [get_hw_devices $dev]
#set_property PROGRAM.FILE $bitfile [get_hw_devices $dev]
set_param xicom.use_bitstream_version_check false

current_hw_device [get_hw_devices $dev]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices $dev] 0]

#set_property PARAM.FREQUENCY 1000000 [current_hw_target]

program_hw_devices [get_hw_devices $dev]

# refresh_hw_device [lindex [get_hw_devices $dev] 0]

close_hw

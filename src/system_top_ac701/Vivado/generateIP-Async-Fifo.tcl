
set partname [lindex $argv 0]
set topDir [lindex $argv 1]

set IPGeneratorName "fifo_generator_0"
set projectName "project_ip_temporal"
append proDir $topDir $projectName "/"
append ipDir $proDir $projectName ".srcs/sources_1/ip/" $IPGeneratorName "/"
append XciFile $ipDir $IPGeneratorName ".xci"
append runsName $IPGeneratorName "_synth_1"

exec rm -rf $proDir

create_project $projectName $proDir -part $partname
create_ip -name fifo_generator -vendor xilinx.com -library ip -module_name $IPGeneratorName

#set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Builtin_FIFO} CONFIG.Input_Data_Width {8} CONFIG.Input_Depth {512} CONFIG.Output_Data_Width {8} CONFIG.Output_Depth {512} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Use_Dout_Reset {false} CONFIG.Data_Count_Width {9} CONFIG.Write_Data_Count_Width {9} CONFIG.Read_Data_Count_Width {9} CONFIG.Read_Clock_Frequency {400} CONFIG.Write_Clock_Frequency {100} CONFIG.Full_Threshold_Assert_Value {505} CONFIG.Full_Threshold_Negate_Value {504} CONFIG.Empty_Threshold_Assert_Value {5} CONFIG.Empty_Threshold_Negate_Value {6}] [get_ips $IPGeneratorName]
set_property -dict [list CONFIG.Fifo_Implementation {Independent_Clocks_Block_RAM} CONFIG.Input_Data_Width {32} CONFIG.Input_Depth {1024} CONFIG.Output_Data_Width {32} CONFIG.Output_Depth {1024} CONFIG.Reset_Type {Asynchronous_Reset} CONFIG.Full_Flags_Reset_Value {1} CONFIG.Use_Dout_Reset {true} CONFIG.Data_Count_Width {10} CONFIG.Write_Data_Count_Width {10} CONFIG.Read_Data_Count_Width {10} CONFIG.Full_Threshold_Assert_Value {1021} CONFIG.Full_Threshold_Negate_Value {1020} CONFIG.Empty_Threshold_Assert_Value {2} CONFIG.Empty_Threshold_Negate_Value {3} CONFIG.Enable_Safety_Circuit {true}] [get_ips $IPGeneratorName]

generate_target {instantiation_template} [get_files $XciFile]
update_compile_order -fileset sources_1
generate_target all [get_files  $XciFile]
catch { config_ip_cache -export [get_ips -all $IPGeneratorName] }
export_ip_user_files -of_objects [get_files $XciFile] -no_script -sync -force 
create_ip_run [get_files -of_objects [get_fileset sources_1] $XciFile]
launch_runs -jobs 16 $runsName

exec cp -rf $ipDir $topDir
exec rm -rf $proDir


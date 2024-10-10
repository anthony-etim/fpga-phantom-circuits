
# def NNLoc():
#     lines=[]
#     lines.append("\n")
#     lines.append("#FC locations\n")
#     lines.append("create_pblock pblock_fc_INST_1\n")
#     lines.append("add_cells_to_pblock [get_pblocks pblock_fc_INST_1] [get_cells -quiet [list fullyConnected_DUT]]\n")
#     lines.append("resize_pblock [get_pblocks pblock_fc_INST_1] -add {CLOCKREGION_X0Y5:CLOCKREGION_X1Y6}\n")
#     lines.append("\n")

#     return lines

def read_xdc_lib(file):
    lines=[]
    with open(file, "r") as f:
        lines = f.readlines()
    return lines

def ILASetup(signal_name_width, clk_freq):
    lines= []
    lines.append("\n")
    lines.append("#ILA\n")
    lines.append("create_debug_core u_ila_0 ila\n")
    lines.append("set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]\n")
    lines.append("set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]\n")
    lines.append("set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]\n")
    lines.append("set_property port_width 1 [get_debug_ports u_ila_0/clk]\n")
    lines.append("connect_debug_port u_ila_0/clk [get_nets [list clk]]\n")
    lines.append("\n")

    
    for i_probe in range(len(signal_name_width)):
        lines.append("set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe%d]\n"%(i_probe))
        lines.append("set_property port_width %d [get_debug_ports u_ila_0/probe%d]\n"%(signal_name_width[i_probe][1], i_probe))
        if (signal_name_width[i_probe][1]>1):
            tmp = ""
            # {next_ro_state[0]} {next_ro_state[1]} {next_ro_state[2]} {next_ro_state[3]}
            for j in range(signal_name_width[i_probe][1]):
                tmp = tmp + " {%s[%d]}"%(signal_name_width[i_probe][0], j)
        else:# fullyConnected_DUT/start_fc
            tmp = " %s"%(signal_name_width[i_probe][0])
        lines.append("connect_debug_port u_ila_0/probe%d [get_nets [list%s]]\n"%(i_probe, tmp))
        if (i_probe < len(signal_name_width)-1):
            lines.append("create_debug_port u_ila_0 probe\n")
    lines.append("\n")
    lines.append("set_property C_CLK_INPUT_FREQ_HZ %d [get_debug_cores dbg_hub]\n"%(clk_freq))
    lines.append("set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]\n")
    lines.append("set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]\n")
    lines.append("connect_debug_port dbg_hub/clk [get_nets clk]\n")
    lines.append("\n")
    lines.append("\n")

    return lines

def writeXDC(constraints, fileName="ac701_rev2.0.xdc"):
    with open(fileName, "w") as f:
        for l in constraints:
            f.write(l)





if __name__ == "__main__":
    signal_name_width = [("simple_transmitter_INST/txBit", 1), \
                         ("phantum_DUT/roCounts[0]", 32),\
                         ("phantum_DUT/roCounts[1]", 32),\
                         ("phantum_DUT/offset_counter[0]", 32),\
                         ("phantum_DUT/offset_counter[1]", 32),\
                         ("phantum_DUT/enableSensor", 2),\
                         ("phantum_DUT/state", 3),\
                         ("reset_sw", 1),\
                         ("start_phantum", 1),\
                         ("sendbit", 1),\
                         ("delayCycles", 32),\
                         ("state", 5),\
                         ("phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_counter_reset", 1),\
                         ("phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_counter_reset", 1),\
                         ("phantum_DUT/GEN_ROSENSORS[0].roSensor_DUT/ro_enable_internal", 1),\
                         ("phantum_DUT/GEN_ROSENSORS[1].roSensor_DUT/ro_enable_internal", 1),\
                         ("simple_transmitter_INST/tx_wire", 1),\
                         ("simple_transmitter_INST/tx_wire_second", 1),\
                         ("simple_transmitter_INST/tx_wire_third", 1),\
                         ("simple_transmitter_INST/tx_wire_fourth", 1),\
                        ]
    # constraints =read_xdc_lib("clock.xdc") + read_xdc_lib("longwires.xdc") + ILASetup(signal_name_width, 200_000_000)
    constraints =read_xdc_lib("clock.xdc") + read_xdc_lib("longwires.xdc")
    writeXDC(constraints)




    
#!/usr/bin/python3.8
import numpy as np
import sys
# from matplotlib.legend import Legend
from matplotlib import pyplot as plt

def get_super(x):
    normal = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-=()"
    super_s = "ᴬᴮᶜᴰᴱᶠᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾQᴿˢᵀᵁⱽᵂˣʸᶻᵃᵇᶜᵈᵉᶠᵍʰᶦʲᵏˡᵐⁿᵒᵖ۹ʳˢᵗᵘᵛʷˣʸᶻ⁰¹²³⁴⁵⁶⁷⁸⁹⁺⁻⁼⁽⁾"
    res = x.maketrans(''.join(normal), ''.join(super_s))
    return x.translate(res)

if __name__ == "__main__":
    
    plot_path     = '/home/anthony/Documents/fpga-phantom-circuits/src/covert_transmitter/scripts/plots/'
    
    ##########################################################################
    ## Varying cycles

    ##########################################################################
    ## fpga_kc705-02_vs_ac701-01 and fpga_ac701-01_vs_kc705-02
    ##########################################################################
    accuracy_0 = [37.5, 43.75, 100, 78.12, 46.88, 21.88]
    accuracy_1 = [50, 65.62, 50, 90.62, 100, 100]
    # x = np.arange(0,12,2)
    x = ['2'+get_super('10'), '2'+get_super('12'), '2'+get_super('15'),'2'+get_super('18'), '2'+get_super('21'), '2'+get_super('23')]
    
    plt.figure(figsize=(6.4,5.5))
    line_1, = plt.plot(x, accuracy_0, color = 'r',marker="s", label='AC701-01')
    line_2, = plt.plot(x, accuracy_1, color = 'b',marker="o", label='KC705-02')
    first_legend = plt.legend(handles=[line_1], title="Source FPGA: KC705-02\nSink FPGA: ", loc="upper left",fancybox=True, fontsize=16)
    ax = plt.gca().add_artist(first_legend)
    second__legend = plt.legend(handles=[line_2], title="Source FPGA: AC701-01\nSink FPGA: ", loc="lower center",fancybox=True, fontsize=16)
    plt.xlabel("Number of Cycles", fontsize=16)
    plt.ylabel("Accuracy (%)", fontsize=16)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.grid()
    plt.savefig(plot_path + "cycles_ro_fpga_kc705-02_vs_ac701-01_and_ro_fpga_ac701-01_vs_kc705-02.pdf")
    plt.clf()
    ##########################################################################

    ##########################################################################
    ## varying Number of Enabled transmitters

    ##########################################################################
    ## fpga_kc705-02_vs_ac701-01 and fpga_ac701-01_vs_kc705-02
    ##########################################################################
    accuracy_0 = [53.12, 56.25, 65.62, 68.75, 68.75, 68.75, 75, 84.38, 78.12, 87.5, 100, 90.62, 96.88, 100, 100]
    x_0 = np.arange(0,15,1)
    accuracy_1 = [31.25, 90.62, 87.5, 100, 100, 100, 100, 100, 100, 100, 100]
    x_1 = np.arange(0,11,1)
    
    plt.figure(figsize=(6.4,5.5))
    line_1, = plt.plot(x_0, accuracy_0, color = 'r',marker="s", label='AC701-01')
    line_2, = plt.plot(x_1, accuracy_1, color = 'b',marker="o", label='KC705-02')
    first_legend = plt.legend(handles=[line_1], title="Source FPGA: KC705-02\nSink FPGA: ", loc="center right",fancybox=True, fontsize=16)
    ax = plt.gca().add_artist(first_legend)
    second__legend = plt.legend(handles=[line_2], title="Source FPGA: AC701-01\nSink FPGA: ", loc="lower right",fancybox=True, fontsize=16)
    plt.xlabel("Number of Enabled Transmitters", fontsize=16)
    plt.ylabel("Accuracy (%)", fontsize=16)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.grid()
    plt.savefig(plot_path + "enabled_trans_fpga_kc705-02_vs_ac701-01_and_fpga_ac701-01_vs_kc705-02.pdf")
    plt.clf()
    # sys.exit()
    ##########################################################################

    ##########################################################################
    ## CPU 

    ##########################################################################
    ## cpu_vs_ac701-01 and cpu_vs_kc705-02
    ##########################################################################
    accuracy_0 = [59.58, 71.88, 81.25, 84.38, 93.75, 100, 100, 93.75, 93.75, 93.75, 87.5, 93.75, 90.62]
    accuracy_1 = [56.25, 71.88, 87.5, 93.75, 87.5, 93.75, 93.75, 93.75, 100, 93.75, 96.88, 100, 96.88]
    x = np.arange(0,26,2)

    line_1, = plt.plot(x, accuracy_0, color = 'r',marker="s", label='AC701-01')
    line_2, = plt.plot(x, accuracy_1, color = 'b',marker="o", label='KC705-02')
    first_legend = plt.legend(handles=[line_1], title="Sink FPGA: ", loc="center right",fancybox=True)
    ax = plt.gca().add_artist(first_legend)
    second__legend = plt.legend(handles=[line_2], title="Sink FPGA: ", loc="lower right",fancybox=True)
    plt.xlabel("Number of CPU Threads", fontsize=16)
    plt.ylabel("Accuracy (%)", fontsize=16)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=16)
    plt.grid()
    plt.savefig(plot_path + "cpu_vs_ac701-01_and_cpu_vs_kc705-02.pdf")
    plt.clf()
    ##########################################################################
    
    # #####################################
    # ## cpu_vs_kc705-02
    # #####################################
    # accuracy = [43.75,68.75,84.38,96.88,96.88,93.75,96.88,100,100,100,96.88,93.75,93.75]
    

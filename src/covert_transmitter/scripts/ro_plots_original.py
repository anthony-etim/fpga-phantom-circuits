#!/usr/bin/python3.8
import numpy as np
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

    #####################################
    ## fpga_kc705-02_vs_ac701-01
    #####################################
    accuracy = [37.5, 43.75, 100, 78.12, 46.88, 21.88]
    # x = np.arange(0,12,2)
    x = ['2'+get_super('10'), '2'+get_super('12'), '2'+get_super('15'),'2'+get_super('18'), '2'+get_super('21'), '2'+get_super('23')]
    
    plt.plot(x, accuracy, color = 'r',marker="o", label='AC701-01')
    plt.legend(title="Source FPGA: KC705-02\nSink FPGA: ", loc="best",fancybox=True, fontsize=14)
    plt.xlabel("Number of Cycles", fontsize=12)
    plt.ylabel("Accuracy (%)", fontsize=14)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=14)
    plt.grid()
    plt.savefig(plot_path + "cycles_ro_fpga_kc705-02_vs_ac701-01.pdf")
    plt.clf()
    
    #####################################
    ## fpga_ac701-01_vs_kc705-02
    #####################################
    accuracy = [50, 65.62, 50, 90.62, 100, 100]
    # x = np.arange(0,12,2)
    x = ['2'+get_super('10'), '2'+get_super('12'), '2'+get_super('15'),'2'+get_super('18'), '2'+get_super('21'), '2'+get_super('23')]
    
    plt.plot(x, accuracy, color = 'r',marker="o", label='KC705-02')
    plt.legend(title="Source FPGA: AC701-01\nSink FPGA: ", loc="best",fancybox=True, fontsize=14)
    plt.xlabel("Number of Cycles", fontsize=12)
    plt.ylabel("Accuracy (%)", fontsize=14)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=14)
    plt.grid()
    plt.savefig(plot_path + "cycles_ro_fpga_ac701-01_vs_kc705-02.pdf")
    plt.clf()
    ##########################################################################

    ##########################################################################
    ## varying Number of Enabled transmitters

    #####################################
    ## fpga_ac701-01_vs_kc705-02
    #####################################
    accuracy = [31.25, 90.62, 87.5, 100, 100, 100, 100, 100, 100, 100, 100]
    x = np.arange(0,11,1)
    
    plt.plot(x, accuracy, color = 'r',marker="o", label='KC705-02')
    plt.legend(title="Source FPGA: AC701-01 Sink FPGA: ", loc="best",fancybox=True, fontsize=14)
    plt.xlabel("Number of Enabled Transmitters", fontsize=12)
    plt.ylabel("Accuracy (%)", fontsize=14)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=14)
    plt.grid()
    plt.savefig(plot_path + "enabled_trans_fpga_ac701-01_vs_kc705-02.pdf")
    plt.clf()

    #####################################
    ## fpga_kc705-02_vs_ac701-01
    #####################################
    accuracy = [53.12, 56.25, 65.62, 68.75, 68.75, 68.75, 75, 84.38, 78.12, 87.5, 100, 90.62, 96.88, 100, 100]
    x = np.arange(0,15,1)
    
    plt.plot(x, accuracy, color = 'r',marker="o", label='AC701-01')
    plt.legend(title="Source FPGA: KC705-02 Sink FPGA: ", loc="best",fancybox=True, fontsize=14)
    plt.xlabel("Number of Enabled Transmitters", fontsize=12)
    plt.ylabel("Accuracy (%)", fontsize=14)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=14)
    plt.grid()
    plt.savefig(plot_path + "enabled_trans_fpga_kc705-02_vs_ac701-01.pdf")
    plt.clf()
    ##########################################################################

    ##########################################################################
    ## CPU 

    #####################################
    ## cpu_vs_ac701-01
    #####################################
    accuracy = [59.58, 71.88, 81.25, 84.38, 93.75, 100, 100, 93.75, 93.75, 93.75, 87.5, 93.75, 90.62]
    x = np.arange(0,26,2)

    plt.plot(x, accuracy, color = 'r',marker="o", label='AC701-01')
    plt.legend(title="Sink FPGA: ", loc="best",fancybox=True)
    plt.xlabel("Number of CPU Threads", fontsize=12)
    plt.ylabel("Accuracy (%)", fontsize=14)
    plt.xticks(fontsize=16)
    plt.yticks(fontsize=14)
    plt.grid()
    plt.savefig(plot_path + "cpu_vs_ac701-01.pdf")
    plt.clf()

    # #####################################
    # ## cpu_vs_kc705-02
    # #####################################
    # accuracy = [43.75,68.75,84.38,96.88,96.88,93.75,96.88,100,100,100,96.88,93.75,93.75]
    # x = np.arange(0,26,2)
    
    # plt.plot(x, accuracy, color = 'r',marker="o", label='KC705-02')
    # plt.legend(title="Sink FPGA: ", loc="best",fancybox=True)
    # plt.xlabel("Number of CPU Threads", fontsize=12)
    # plt.ylabel("Accuracy (%)", fontsize=14)
    # plt.xticks(fontsize=16)
    # plt.yticks(fontsize=14)
    # plt.grid()
    # plt.savefig(plot_path + "cpu_vs_kc705-02.pdf")
    # plt.clf()
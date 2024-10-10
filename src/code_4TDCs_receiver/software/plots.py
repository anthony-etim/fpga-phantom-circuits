#!/usr/bin/python3.8
import numpy as np
from matplotlib import pyplot as plt

if __name__ == "__main__":
    
    plot_path     = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/plots/'
    
    accuracy = [100]*8
    x = np.arange(0,16,2)
    
    plt.plot(x, accuracy, color = 'b',marker="o", label='AC701-01')
    plt.legend(title="Source FPGA: KC705-02 Sink FPGA: ",loc="lower right",fancybox=True)
    plt.xlabel("Number of Enabled Transmitters")
    plt.ylabel("Accuracy (%)")
    plt.grid()
    plt.savefig(plot_path + "kc705-02_vs_fpga_ac701-01.png")
    plt.clf()
import numpy as np
from matplotlib import pyplot as plt

if __name__ == '__main__':
    
    plot_path = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/plots/'
    ####################################
    ## TDC 0
    ####################################
    local_stressor_0 = np.mean([50, 75, 87.5, 62.5, 50])
    local_stressor_1 = np.mean([25, 50, 50, 62.5, 12.5])
    local_stressor_2 = np.mean([37.5, 75, 62.5, 37.5, 37.5])
    local_stressor_3 = np.mean([50, 62.5, 25.0, 62.5, 50])
    local_stressor_4 = np.mean([75, 62.5, 37.5, 62.5, 37.5])
    local_stressor_5 = np.mean([62.5, 62.5, 50, 75, 50])
    local_stressor_6 = np.mean([75, 25, 50, 75, 37.5])
    local_stressor_7 = np.mean([50, 50, 50, 37.5, 50])
    local_stressor_8 = np.mean([50, 37.5, 75, 50, 37.5])
    tdc_0_local_stressor_runs = [local_stressor_0, local_stressor_1, local_stressor_2,local_stressor_3, local_stressor_4, local_stressor_5, local_stressor_6, local_stressor_7, local_stressor_8]
    
    plt.plot(tdc_0_local_stressor_runs, color = 'r', marker="o")
    plt.title('TDC_0 Accuracy ')
    plt.xlabel("Local Stressor Number")
    plt.ylabel("Accuracy")
    plt.ylim(0, 100)
    plt.grid()
    plt.savefig(plot_path + "tdc_0_accuracy.png")
    plt.clf()
    
    ####################################
    ## TDC 1
    ####################################
    local_stressor_0 = np.mean([25, 87.5, 75, 62.5, 50])
    local_stressor_1 = np.mean([25, 50, 50, 62.5, 37.5])
    local_stressor_2 = np.mean([62.5, 62.5, 50, 37.5, 50])
    local_stressor_3 = np.mean([37.5, 62.5, 37.5, 62.5, 50])
    local_stressor_4 = np.mean([50, 50, 37.5, 62.5, 37.5])
    local_stressor_5 = np.mean([62.5, 50, 50, 62.5, 37.5])
    local_stressor_6 = np.mean([37.5, 25, 50, 75, 62.5])
    local_stressor_7 = np.mean([50, 50, 50, 37.5, 50])
    local_stressor_8 = np.mean([37.5, 37.5, 62.5, 62.5, 37.5])
    tdc_1_local_stressor_runs = [local_stressor_0, local_stressor_1, local_stressor_2,local_stressor_3, local_stressor_4, local_stressor_5, local_stressor_6, local_stressor_7, local_stressor_8]
    
    plt.plot(tdc_1_local_stressor_runs, color = 'r', marker="o")
    plt.title('TDC_1 Accuracy ')
    plt.xlabel("Local Stressor Number")
    plt.ylabel("Accuracy")
    plt.ylim(0, 100)
    plt.grid()
    plt.savefig(plot_path + "tdc_1_accuracy.png")
    plt.clf()
    
    ####################################
    ## TDC 2
    ####################################
    local_stressor_0 = np.mean([25, 75, 87.5, 62.5, 25])
    local_stressor_1 = np.mean([25, 50, 37.5, 62.5, 25])
    local_stressor_2 = np.mean([37.5, 62.5, 50, 37.5, 37.5])
    local_stressor_3 = np.mean([50, 62.5, 25, 75, 50])
    local_stressor_4 = np.mean([62.5, 50, 37.5, 75, 50])
    local_stressor_5 = np.mean([62.5, 50, 37.5, 75, 50])
    local_stressor_6 = np.mean([75, 25, 50, 87.5, 62.5])
    local_stressor_7 = np.mean([50, 37.5, 50, 37.5, 50])
    local_stressor_8 = np.mean([37.5, 37.5, 50, 62.5, 25])
    tdc_2_local_stressor_runs = [local_stressor_0, local_stressor_1, local_stressor_2,local_stressor_3, local_stressor_4, local_stressor_5, local_stressor_6, local_stressor_7, local_stressor_8]
    
    plt.plot(tdc_2_local_stressor_runs, color = 'r', marker="o")
    plt.title('TDC_2 Accuracy ')
    plt.xlabel("Local Stressor Number")
    plt.ylabel("Accuracy")
    plt.ylim(0, 100)
    plt.grid()
    plt.savefig(plot_path + "tdc_2_accuracy.png")
    plt.clf()

    ####################################
    ## TDC 3
    ####################################
    local_stressor_0 = np.mean([25, 75, 87.5, 75, 25])
    local_stressor_1 = np.mean([25, 62.5, 62.5, 62.5, 25])
    local_stressor_2 = np.mean([25, 75, 62.5, 25, 37.5])
    local_stressor_3 = np.mean([37.5, 62.5, 37.5, 62.5, 50])
    local_stressor_4 = np.mean([62.5, 62.5, 37.5, 62.5, 50])
    local_stressor_5 = np.mean([75, 75, 75, 62.5, 37.5])
    local_stressor_6 = np.mean([75, 25, 50, 62.5, 37.5])
    local_stressor_7 = np.mean([50, 62.5, 62.5, 37.5, 50])
    local_stressor_8 = np.mean([37.5, 12.5, 62.5, 62.5, 50])
    tdc_3_local_stressor_runs = [local_stressor_0, local_stressor_1, local_stressor_2,local_stressor_3, local_stressor_4, local_stressor_5, local_stressor_6, local_stressor_7, local_stressor_8]
    
    plt.plot(tdc_3_local_stressor_runs, color = 'r', marker="o")
    plt.title('TDC_3 Accuracy ')
    plt.xlabel("Local Stressor Number")
    plt.ylabel("Accuracy")
    plt.ylim(0, 100)
    plt.grid()
    plt.savefig(plot_path + "tdc_3_accuracy.png")
    plt.clf()



    
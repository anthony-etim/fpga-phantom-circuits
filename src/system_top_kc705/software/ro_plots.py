#!/usr/bin/python3.8
import numpy as np
from utilities import *
from matplotlib import pyplot as plt
import os


# the data from this 
roCounts      = [[],[],[],[]]
roCounts_zero = [[],[],[],[]]
roCounts_one  = [[],[],[],[]]
data  = [[],[],[],[]]


num_tx_bit = 4

def phantum_plot(file,num_measurements,txbit):
    data_tmp = np.load(file)['data']
    for i in range(4):
        data[i] = data_tmp[i].tolist()

    # data = data.tolist()
    # print(data)

    # Determining tx bits data
    if txbit == 0:
        for i in range(4):
            # print(data[i], "\n")
            for j in range(0, num_measurements*num_tx_bit*num_tx_bit,4):
                # print(j)
                if data[i].index(j+2)%2 ==0:
                    # rocounts for expected Data
                    roCounts_zero[i].append(data[i][data[i].index(j)])
                # else:
                #     # rocounts for 0's
                #     roCounts_zero[i].append(roCounts[i][roCounts[i].index(j)])
    
    if txbit == 15:
        for i in range(4):
            # print(data[i], "\n")
            for j in range(0, num_measurements*num_tx_bit*num_tx_bit,4):
                # print(j)
                if data[i].index(j+2)%2 ==0:
                    # rocounts for expected Data
                    roCounts_one[i].append(data[i][data[i].index(j)])

    if txbit == 10:
        roCounts_zero = [[],[],[],[]]
        roCounts_one  = [[],[],[],[]]
        for i in range(4):
            # print(data[i], "\n")
            for j in range(len(data[i])):
                # print(j)
                if data[i].index(j+2)%2 ==0:
                    # rocounts for expected Data 1's
                    roCounts_one[i].append(data[i][data[i].index(j)])
                
                if data[i].index(j+6)%2 ==0:
                    # rocounts for expected Data 0's
                    roCounts_zero[i].append(data[i][data[i].index(j)])
    
        for i in range(4):
            roCounts[i] = roCounts_one[i] + roCounts_zero[i]
            samples = [i+1 for i in range(len(roCounts[i]))]
            # print(samples)
            fig_ro_1 = plt.plot(roCounts_zero[i], 'bx', label="zero")
            fig_ro_2 = plt.plot(roCounts_one[i],  'r.', label="one")
            plt.title('RO COUNTS_' + + ' OFFSET ' + str(i)+ "txbit_"+ str(txbit))
            plt.legend(loc="upper right")
            plt.xlabel("Samples")
            plt.ylabel("RO Counts")
            # plt.ylim(2054000, 2056000)
            plt.savefig("ro_counts_" + str(i)+ "txbit_"+ str(txbit) + ".png")
            plt.clf()
            



if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-f', '--file', default='data file')
    parser.add_argument('-n', '--num_measurements', default=100, type=int, required=False, help='Number of times to repeat.') 
    # parser.add_argument('--startrange', default=0, type=int, required=False, help='Start range for threshold.') 
    # parser.add_argument('--stoprange', default=500, type=int, required=False, help='Stop range for threshold.') 
    # parser.add_argument('--rangestep', default=100, type=int, required=False, help='Range step for threshold.') 
    parser.add_argument('--bit', default=None, type=int, required=False, help='User Input Data to send to FPGA.') 
    args = parser.parse_args()


    data = args.bit
    tx_data = bin(data)
    tx_data = tx_data.replace("0b","")
    tx_data_new = ""
    for i in range(4):
        # print(tx_data)
        if(tx_data[i]=="1"):
            tx_data_new += "01"
        else:
            tx_data_new += "10"

    print(tx_data_new)

    tx_data_new = int(tx_data_new,2)
    print(tx_data_new)
#
# Copyright (C) 2022
# Author: Anthony Etim <anthony.etim@yale.edu>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
#

import argparse
import matplotlib.pylab as pylab
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np

num_tx_bit = 4

def split(a, n):
    k, m = divmod(len(a), n)
    return (a[i*k+min(i, m):(i+1)*k+min(i+1, m)] for i in range(n))

threshold_count = 0
threshold_data_error = []

def analysis(file,num_measurements,start_range,stop_range,range_step,threshold_data_error,threshold_count,txbit):
    #tx_bits = [[0]*num_measurements*num_tx_bit,[0]*num_measurements*num_tx_bit,[0]*num_measurements*num_tx_bit,[0]*num_measurements*num_tx_bit]
    tx_bits =     [[],[],[],[]]
    tx_bits_ref = [[],[],[],[]]
    error_count = [[],[],[],[]]
    
    data = np.load(file)['data']
    # print(data)

    threshold = start_range

    while threshold <= stop_range:

        # Determining tx bits data
        for i in range(4):
            # print(data[i], "\n")
            for j in range(0, num_measurements*num_tx_bit*num_tx_bit,4):
                # print(j)
                # print((data[i][j+2] - data[i][j]))
                if ((data[i][j+2] - data[i][j]) > threshold):
                    tx_bits[i].append(1)
                    # count = 0
                else:
                    tx_bits[i].append(0)
                    # count = count +2
            tx_bits[i] = list(split(tx_bits[i],num_measurements))
            
            ##############################
            # tx bits reference
            if txbit == 10:  ## 1010
                for j in range(num_measurements*num_tx_bit):
                    if j % 2 == 0:
                        # appending 1 on even index
                        tx_bits_ref[i].append(1)
                    else:
                        # appending 0 on odd index
                        tx_bits_ref[i].append(0)
            
            if txbit == 0:  ## 0000
                for j in range(num_measurements*num_tx_bit):
                    tx_bits_ref[i].append(0)
                
            if txbit == 15:  ## 1111
                for j in range(num_measurements*num_tx_bit):
                    tx_bits_ref[i].append(1)
            
            if txbit == 5:  ## 0101
                for j in range(num_measurements*num_tx_bit):
                    if j % 2 == 0:
                        # appending 0 on even index
                        tx_bits_ref[i].append(0)
                    else:
                        # appending 1 on odd index
                        tx_bits_ref[i].append(1)
                        
            tx_bits_ref[i] = list(split(tx_bits_ref[i],num_measurements))
            ##############################
            # error_count[i] = list(split(error_count[i],num_measurements))

        # Error
        count = 0
        for k in range(4):
            for l in range(num_measurements):
                for m in range(4):
                    #print(((tx_bits[k][l][m])==(tx_bits_ref[k][l][m])))
                    if((tx_bits[k][l][m])!=(tx_bits_ref[k][l][m])): # comparing tx bits to ref
                        count = count + 1

                error_count[k].append(count*25)
                count = 0

        print("Org",tx_bits)
        print("Ref",tx_bits_ref)
        print("Ect",error_count)
        print("")

        threshold_data_error.append(error_count)
        # print(threshold_count)
        threshold_count = threshold_count +1
        # print(threshold_data_error)
        # print("")

        tx_bits =     [[],[],[],[]]
        tx_bits_ref = [[],[],[],[]]
        error_count = [[],[],[],[]]
        threshold = threshold + range_step

    temp_zero = [] # counter 0
    temp_one = [] # counter 1
    temp_two = [] # counter 2
    temp_three = [] # counter 3
    for i in range(threshold_count):
        # print("threshold ",i,threshold_data_error[i])
        for j in range(len(threshold_data_error[i])):
            if (j == 0):
                temp_zero.append(threshold_data_error[i][j])
            
            if (j == 1):
                temp_one.append(threshold_data_error[i][j])
            
            if (j == 2):
                temp_two.append(threshold_data_error[i][j])
            
            if (j == 3):
                temp_three.append(threshold_data_error[i][j])
    print("")
    print(temp_zero)
    print(temp_one)
    print(temp_two)
    print(temp_three)

    # print("Threshold count", threshold_count)
    # Plot Counter 0
    for i in range(threshold_count):
        # x = list(range(0,threshold_count)) # num of measurements
        x = [i] * num_measurements
        # print(x)
        # print(temp_zero[i])
        # plt.scatter(x,temp_zero[i], label = "Threshold" +str(i))
        plt.plot(x,temp_zero[i], "+", label = "Threshold" +str(i))
    # plt.legend(loc="upper right")
    plt.legend(loc="upper right", prop={'size': 6})
    plt.xlabel("Threshold No.")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_' + str(0) + ' OFFSET '+ "txbit_" + str(txbit))
    plt.ylim(-1,175)
    plt.show()
    plt.savefig("counter_0_txbit_" + str(txbit)+ ".png")
    plt.clf()

    # Plot Counter 1
    for i in range(threshold_count):
        # x = list(range(0,num_measurements)) # num of measurements
        x = [i] * num_measurements
        # plt.scatter(x,temp_one[i], label = "Threshold" +str(i))
        plt.plot(x,temp_one[i], "+", label = "Threshold" +str(i))
    plt.legend(loc="upper right", prop={'size': 6})
    plt.xlabel("Threshold No.")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_' + str(1) + ' OFFSET '+ "txbit_" + str(txbit))
    plt.ylim(-1,175)
    plt.show()
    plt.savefig("counter_1_txbit_" + str(txbit)+ ".png")
    plt.clf()

    # Plot Counter 2
    for i in range(threshold_count):
        #x = list(range(0,num_measurements)) # num of measurements
        x = [i] * num_measurements
        # plt.scatter(x,temp_two[i], label = "Threshold" +str(i))
        plt.plot(x,temp_two[i], "+", label = "Threshold" +str(i))
    plt.legend(loc="upper right", prop={'size': 6})
    plt.xlabel("Threshold No.")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_' + str(2) + ' OFFSET '+ "txbit_" + str(txbit))
    plt.ylim(-1,175)
    plt.show()
    plt.savefig("counter_2_txbit_" + str(txbit)+ ".png")
    plt.clf()

    # Plot Counter 3
    for i in range(threshold_count):
        #x = list(range(0,num_measurements)) # num of measurements
        x = [i] * num_measurements
        # plt.scatter(x,temp_three[i], label = "Threshold" +str(i))
        plt.plot(x,temp_three[i], "+", label = "Threshold" +str(i))
    plt.legend(loc="upper right", prop={'size': 6})
    plt.xlabel("Threshold No.")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_' + str(3) + ' OFFSET '+ "txbit_" + str(txbit))
    plt.ylim(-1,175)
    plt.show()
    plt.savefig("counter_3_txbit_" + str(txbit)+ ".png")
    plt.clf()



    
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--file', default='data file')
    parser.add_argument('-n', '--num_measurements', default=100, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('--startrange', default=0, type=int, required=False, help='Start range for threshold.') 
    parser.add_argument('--stoprange', default=500, type=int, required=False, help='Stop range for threshold.') 
    parser.add_argument('--rangestep', default=100, type=int, required=False, help='Range step for threshold.') 
    parser.add_argument('--bit', default=None, type=int, required=False, help='User Input Data to send to FPGA.') 
    args = parser.parse_args()

    file = args.file
    num_measurements = args.num_measurements
    start_range = args.startrange
    stop_range =  args.stoprange
    range_step = args.rangestep
    txbit = args.bit

    analysis(file,num_measurements,start_range,stop_range,range_step,threshold_data_error,threshold_count,txbit)
    


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


def split(a, n):
    k, m = divmod(len(a), n)
    return (a[i*k+min(i, m):(i+1)*k+min(i+1, m)] for i in range(n))

# def indices(lst, item):
#      return [i for i, x in enumerate(lst) if x == item]

def analysis(file,num_measurements,txbit,num_tx_bits,cooldown_cycles,delay_cycles):
    # tx_bits  =     [[],[],[],[]]
    tx_bits  =     []
    tx_bits_diff = [[],[],[],[]]
    tx_bits_ref  = []
    error_count  = []
    best_offset  = []
    index_offset = []
    best_offset_new = []
    expected_offset = []
    
    roCounts = np.load(file)['data']

    for i in range(4):
        for j in range(0,len(roCounts[i]),2):
            tx_bits_diff[i].append(roCounts[i][j]-roCounts[i][j+1])
        print(tx_bits_diff[i])
    
    for i in range(len(tx_bits_diff[0])):
        for j in range(4):
            best_offset.append((tx_bits_diff[j][i]))
   
    best_offset = list(split(best_offset,num_tx_bits*num_measurements))
    # index_offset = list(split(index_offset,num_tx_bits*num_measurements))
    # best_offset_new = list(split(best_offset_new,num_tx_bits*num_measurements))
    # print(best_offset)
    print("")
    # print(best_offset_new)

    for i in range(num_tx_bits*num_measurements):
        print(best_offset[i])
        res =  [abs(ele) for ele in best_offset[i]]
        max_value = max(res) 
        index_offset.append(res.index(max_value))
        # for j in range(4):
        #     if(best_offset[i][j]<0):

    
    for i in range(num_tx_bits*num_measurements):
        best_offset_new.append(best_offset[i][index_offset[i]])
        
    # Determining tx bits data
    for i in range(len(best_offset_new)):
        if(best_offset_new[i] < 0):
            tx_bits.append(1)
        else:
            tx_bits.append(0)
    
    tx_bits = list(split(tx_bits,num_measurements))
    best_offset_new = list(split(best_offset_new,num_measurements))
    index_offset = list(split(index_offset,num_measurements))
    print("")
    print("offset data",best_offset_new)
    print("indexoffset",index_offset)
    
    ##############################
    ## tx bits reference
    ##############################
    num_tx_bits_tmp = num_tx_bits
    num_tx_bits_tmp = str(num_tx_bits_tmp + 2)
    tx_data = txbit
    tx_data = int(tx_data,16) # convert to int first
    tx_data = format(tx_data,'#0' + num_tx_bits_tmp + 'b')
    tx_data = tx_data.replace("0b","")
    
    for o in range(num_measurements):
        for m in range(len(tx_data)):
            tx_bits_ref.append(int(tx_data[m]))
    
    tx_bits_ref = list(split(tx_bits_ref,num_measurements))
    #############################
    #############################

    
    ##############################
    ## ERROR
    ##############################
    count = 0
    # for k in range(4):
    for l in range(num_measurements):
        for m in range(num_tx_bits):
            #print(((tx_bits[k][l][m])==(tx_bits_ref[k][l][m])))
            if((tx_bits[l][m])!=(tx_bits_ref[l][m])): # comparing tx bits to ref
                count = count + 1

            # if((tx_bits[l][m])==(tx_bits_ref[l][m])): # comparing tx bits to ref

            #     expected_offset.append(indices(tx_bits[l],tx_bits[l][m]))

        error_count.append(count*(100/num_tx_bits))
        count = 0

    print("Org",tx_bits)
    print("Ref",tx_bits_ref)
    print("Ect",error_count)
    print("")
    # print("Expected_offset",expected_offset)
    
    #######################################
    # Plot Counters
    # for i in range(len(error_count)):
    x = list(range(0,num_measurements)) # num of measurements
    print(x)
    print(error_count)
    plt.plot(x,error_count, "ro")
    plt.xlabel("Measurement Number")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_'  'OPTIMAL OFFSET '+ "txbit_" + str(txbit))
    plt.ylim(-1,100)
    plt.show()
    plt.savefig("counter_" +"optimal_txbit_" + str(txbit)+ "_measure" + str(num_measurements) + "_cooldown" + str(cooldown_cycles) + "_cycles_per_bit" + str(delay_cycles) + ".png")
    plt.clf()
    #######################################

    #######################################
    # Index raw Data Plot
    x = np.array(range(0,num_tx_bits)) # num of measurements
    tx_array = np.array([num_tx_bits] * num_tx_bits)
    for i in range(len(best_offset_new)):
        for j in range(num_tx_bits):
            if(index_offset[i][j] == 0):
                plt.plot(x[j],index_offset[i][j], "ro")
            
            if(index_offset[i][j] == 1):
                plt.plot(x[j],index_offset[i][j], "go")
            
            if(index_offset[i][j] == 2):
                plt.plot(x[j],index_offset[i][j], "bo")
            
            if(index_offset[i][j] == 3):
                plt.plot(x[j],index_offset[i][j], "ko")
        x += tx_array        
    plt.show()
    plt.savefig("absolute_offset.png")
    print(index_offset)





    #######################################

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--file', default='data file')
    parser.add_argument('-n', '--num_measurements', default=100, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('--bit', default=None, type=str, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('--num_tx_bits', default=4, type=int, required=False, help='Number of tx bits.') 
    parser.add_argument('--cooldown_cycles', default=4194304, type=int, required=False, help='Cooldown cycles') 
    parser.add_argument('--delay_cycles', default=4194304, type=int, required=False, help='Tx bit Delay cycles')
    args = parser.parse_args()

    file = args.file
    num_measurements = args.num_measurements
    txbit = args.bit
    num_tx_bits = args.num_tx_bits
    cooldown_cycles = args.cooldown_cycles
    delay_cycles = args.delay_cycles

    analysis(file,num_measurements,txbit,num_tx_bits,cooldown_cycles,delay_cycles)
    


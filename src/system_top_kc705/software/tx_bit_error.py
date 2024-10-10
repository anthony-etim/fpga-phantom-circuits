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
from unittest import expectedFailure
import matplotlib.pylab as pylab
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np


def split(a, n):
    k, m = divmod(len(a), n)
    return (a[i*k+min(i, m):(i+1)*k+min(i+1, m)] for i in range(n))

def analysis(file,num_measurements,txbit,num_tx_bits,cooldown_cycles,delay_cycles):
    tx_bits         = [[],[],[],[]]
    tx_bits_ref     = [[],[],[],[]]
    error_count     = [[],[],[],[]]
    expected_offset = [[],[],[],[]]
    
    roCounts = np.load(file)['data']

    # Determining tx bits data
    for i in range(4):
        # print(data[i], "\n")
        for j in range(0,len(roCounts[i]),2):
            # print(j)
            # print((data[i][j+2] - data[i][j]))
            if ((roCounts[i][j]-roCounts[i][j+1] < 0)):
                tx_bits[i].append(1)
            else:
                tx_bits[i].append(0)
             
        tx_bits[i] = list(split(tx_bits[i],num_measurements))


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
                tx_bits_ref[i].append(int(tx_data[m]))
        
        tx_bits_ref[i] = list(split(tx_bits_ref[i],num_measurements))

        expected_offset[i] = list(split(expected_offset[i],num_measurements))

        # if txbit == 10:  ## 1010
        #     for j in range(num_measurements*num_tx_bit):
        #         if j % 2 == 0:
        #             # appending 1 on even index
        #             tx_bits_ref[i].append(1)
        #         else:
        #             # appending 0 on odd index
        #             tx_bits_ref[i].append(0)
        
        # if txbit == 0:  ## 0000
        #     for j in range(num_measurements*num_tx_bit):
        #         tx_bits_ref[i].append(0)
            
        # if txbit == 15:  ## 1111
        #     for j in range(num_measurements*num_tx_bit):
        #         tx_bits_ref[i].append(1)
        
        # if txbit == 5:  ## 0101
        #     for j in range(num_measurements*num_tx_bit):
        #         if j % 2 == 0:
        #             # appending 0 on even index
        #             tx_bits_ref[i].append(0)
        #         else:
        #             # appending 1 on odd index
        #             tx_bits_ref[i].append(1)
        #############################
        #############################
                    

    ##############################
    ## ERROR
    ##############################
    count = 0
    for k in range(4):
        for l in range(num_measurements):
            for m in range(num_tx_bits):
                #print(((tx_bits[k][l][m])==(tx_bits_ref[k][l][m])))
                if((tx_bits[k][l][m])!=(tx_bits_ref[k][l][m])): # comparing tx bits to ref
                    count = count + 1
                
                if((tx_bits[k][l][m])==(tx_bits_ref[k][l][m])): # comparing tx bits to ref
                    expected_offset[k][l].append(m)
                
            error_count[k].append(count*(100/num_tx_bits))
            count = 0
    print("Org",tx_bits)
    print("Ref",tx_bits_ref)
    print("Ect",error_count)
    print("")
    print("")
    print(expected_offset)

    #######################################
    # Plot Counters uncomment later
    # for i in range(len(error_count)):
    #     x = list(range(0,num_measurements)) # num of measurements
    #     print(x)
    #     print(error_count[i])
    #     plt.plot(x,error_count[i], "ro")
    #     plt.xlabel("Measurement Number")
    #     plt.ylabel("Error %")
    #     plt.title('ERROR PERCENT_' + str(i) + ' OFFSET '+ "txbit_" + str(txbit))
    #     plt.ylim(-1,100)
    #     plt.show()
    #     plt.savefig("counter_" + str(i) +"_txbit_" + str(txbit)+ "_measure" + str(num_measurements) + "_cooldown" + str(cooldown_cycles) + "_cycles_per_bit" + str(delay_cycles) + ".png")
    #     plt.clf()
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

    # file = args.file
    file= 'data_rep_phantum_measure200_0xa_cooldown8388608_cycles_per_bit8388608_2022-08-06_19-16-05.npz'
    num_measurements = args.num_measurements
    # txbit = args.bit
    txbit = '0xa'
    # num_tx_bits = args.num_tx_bits
    num_tx_bits = 4
    cooldown_cycles = args.cooldown_cycles
    delay_cycles = args.delay_cycles

    analysis(file,num_measurements,txbit,num_tx_bits,cooldown_cycles,delay_cycles)
    


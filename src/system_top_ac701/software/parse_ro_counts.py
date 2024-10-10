from __future__ import print_function, division

import argparse
import csv
import json
import os
import re
import sys
import math
import numpy as np
import traceback
from matplotlib import pyplot as plt
from scipy.fft import fft, ifft
from scipy import signal
from six import iteritems
import itertools

ro_counts_data_path_list = []
ro_counts_measurements = []

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

def parse_measurements(basedir, ro_counts_measurements, ro_counts_data_path_list):
    # ro_counts_measurements = []
    expdir = basedir  + '/'

    for file in os.listdir(expdir):
        if file.endswith('.csv'):
            ro_counts_data_path_list.append(expdir + file)
                
    ro_counts_data_path_list.sort(key=natural_keys)

    for data_list in ro_counts_data_path_list:
        with open( data_list, 'r' ) as file:
            csvreader = csv.reader(file)
            headers = next(csvreader, None)
            column = {}
            for h in headers:
                column[h] = []
            
            for row in csvreader:
                for h, v in zip(headers, row):
                    column[h].append(float(v))
            
            # measurements = (column['tdc_measurement_0']) + (column['tdc_measurement_1']) + (column['tdc_measurement_2']) + (column['tdc_measurement_3'])
            measurements = (column['ctrl_0_ro_0'])
            ro_counts_measurements.append(measurements)
            

if __name__ == '__main__':
    plot_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/'
    basedir = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/256_AES_no_interferance'
    # basedir = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/phantom_ro_measurements/fpga/32'
    parse_measurements(basedir, ro_counts_measurements, ro_counts_data_path_list)
    ro_counts_measurements = list(itertools.chain.from_iterable(ro_counts_measurements))
    square = signal.square(ro_counts_measurements)
    average = np.average(square)
    square = [x - average  for x in square]
    
    ro_counts_fft = np.fft.fft(ro_counts_measurements)
    ro_counts_len_org = len(ro_counts_measurements)
    ro_counts_len  = np.arange(ro_counts_len_org)
    sr = ro_counts_len_org # sampling rate is the signal length
    print(sr)
    T = ro_counts_len_org/sr
    freq = ro_counts_len/T
    plt.grid()
    plt.xlim(0, 64)
    # plt.stem(freq, np.imag(ro_counts_fft), 'r', markerfmt=" ", basefmt="-r")
    plt.plot(ro_counts_measurements, color='red')
    plt.savefig(plot_path + "ro_counts_data.pdf")
    plt.clf()
    
    ############################################################
    ## Misscalaneous
    # average = np.average(ro_counts_measurements)
    # ro_counts_measurements = [x - average  for x in ro_counts_measurements]
    # ro_counts_measurements_new = []
    # print(len(ro_counts_measurements))
    # for l in range(0,len(ro_counts_measurements),2):
    #     diff = ro_counts_measurements[l+1] - ro_counts_measurements[l]
    #     ro_counts_measurements_new.append(diff)
    #     # print(diff)
    # print(len(ro_counts_measurements_new))
    
    # sys.exit()

    # ro_counts_measurements_new = [ro_counts_measurements_new[l:l + 250] for l in range(0, len(ro_counts_measurements_new), 250)]
    # print(len(ro_counts_measurements_new))
    # sum_measurements = [sum(x) / (len(x))  for x in ro_counts_measurements_new]
    # print((sum_measurements))

    # sys.exit()

    
    # ro_counts_fft = np.absolute(np.fft.fft(square))
    # ro_counts_fft = np.fft.fft(square)
    
    # plt.plot((ro_counts_fft), color = 'red')
    # ro_counts_fft = np.fft.fft(sum_measurements)
    # ro_counts_len = len(ro_counts_measurements_new)
    
    # ro_counts_len = len(sum_measurements)
    # ro_counts_len = len(ro_counts_fft)
    # ro_counts_len = np.arange(ro_counts_len)
    # fftfreq = np.fft.fftfreq(ro_counts_len)
    
    # plt.plot(freq,ro_counts_fft.real, color = 'r')
    # plt.plot(fftfreq, np.imag(ro_counts_fft), color = 'red')
    # plt.plot(ro_counts_len,ro_counts_measurements, color = 'red')
    # plt.plot(ro_counts_len,ro_counts_measurements, color = 'red')
    # plt.plot(ro_counts_len,sum_measurements, color = 'red')
    # plt.title('Phantom Cycles Accuracy ')
    # plt.xlabel("Delay Cycles", fontsize=12)
    # plt.ylabel("Accuracy (%)",fontsize=14)
    # plt.xticks(fontsize=16)
    # plt.yticks(fontsize=14)
    # plt.ylim(top=100)
    # plt.xlim(0,100)
    # plt.grid()
    # # plt.savefig(plot_path + "ro_counts_AES_fft_no_inteference.pdf")
    # plt.savefig(plot_path + "ro_counts_AES.pdf")
    # # plt.savefig(plot_path + "ro_counts_AES_fft_2_cpu_inteference.pdf")
    # # plt.savefig(plot_path + "ro_counts_AES_fft_no_inteference.pdf")
    # plt.clf()
    ############################################################
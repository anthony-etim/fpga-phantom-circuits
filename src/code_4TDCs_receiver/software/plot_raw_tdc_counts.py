#!/usr/bin/python3.8

import time
import datetime
import serial
import os
import sys
import argparse
import subprocess
import multiprocessing
import json
import numpy as np
import secrets
from address import *
from utilities import *
from matplotlib import pyplot as plt
import glob
import re

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

def plot_TDC_SEPARATE(file_1, file_2, plot_path, tdc_no):
    higher_voltage_tdc_count = np.load(file_1)['data']
    lower_voltage_tdc_count = np.load(file_2)['data']
    higher_voltage_tdc_count = np.sort(higher_voltage_tdc_count)
    lower_voltage_tdc_count = np.sort(lower_voltage_tdc_count)

    # print((higher_voltage_tdc_count))
    # print((lower_voltage_tdc_count))

    fig, axes = plt.subplots(1, 2, sharey=True, tight_layout=True)
    axes[0].hist(higher_voltage_tdc_count[0:(int(len(higher_voltage_tdc_count)/2) - 1)], color='red', label='12V HEATER OFF',  bins='auto', alpha=0.8)
    axes[0].hist(lower_voltage_tdc_count[0:(int(len(higher_voltage_tdc_count)/2) - 1)], color='blue', label='11.99V HEATER OFF',  bins='auto', alpha=0.8)
    
    axes[1].hist(higher_voltage_tdc_count[int(len(higher_voltage_tdc_count)/2):], color='green', label='12V HEATER ON',  bins='auto', alpha=0.8)
    axes[1].hist(lower_voltage_tdc_count[int(len(higher_voltage_tdc_count)/2):], color='yellow', label='11.99V HEATER ON',  bins='auto', alpha=0.8)
    axes[0].legend()
    axes[1].legend()

    # plt.hist(lower_voltage_tdc_count,  color='blue', label='11.9V',  bins='auto', alpha=0.8)
    # plt.legend()
    plt.title('TDC ' + str(tdc_no) + ' COUNTS')
    plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
    plt.clf()


def plot_TDC_TOGETHER(file_1, file_2, plot_path, tdc_no):
    higher_voltage_tdc_count = np.load(file_1)['data']
    lower_voltage_tdc_count = np.load(file_2)['data']
    higher_voltage_tdc_count = np.sort(higher_voltage_tdc_count)
    lower_voltage_tdc_count = np.sort(lower_voltage_tdc_count)

    plt.hist(higher_voltage_tdc_count, color='red', label='12V',  bins='auto', alpha=0.8)
    plt.hist(lower_voltage_tdc_count, color='blue', label='11.99V ',  bins='auto', alpha=0.8)
    plt.legend()

    plt.title('TDC ' + str(tdc_no) + ' COUNTS')
    plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
    plt.clf()

if __name__ == "__main__":
    
    plot_path = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/plots/'
    tdc_count_higher_path_pwd = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/data/tdc_raw_data_12V/'
    tdc_count_lower_path_pwd = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/data/tdc_raw_data_11.99V/'
    tdc_count_higher_voltage_path_list = []
    tdc_count_lower_voltage_path_list = []

    os.chdir(tdc_count_higher_path_pwd)
    for file in glob.glob("*.npz"):
        tdc_count_higher_voltage_path_list.append(file)

    tdc_count_higher_voltage_path_list = sorted(tdc_count_higher_voltage_path_list,key=natural_keys)

    os.chdir(tdc_count_lower_path_pwd)
    for file in glob.glob("*.npz"):
        tdc_count_lower_voltage_path_list.append(file)

    tdc_count_lower_voltage_path_list = sorted(tdc_count_lower_voltage_path_list,key=natural_keys)

    # print(tdc_count_higher_voltage_path_list)
    # print(tdc_count_lower_voltage_path_list)
    
    for i in range(4):
        TDC_higher_voltage_count_path = tdc_count_higher_path_pwd + tdc_count_higher_voltage_path_list[i] 
        TDC_lower_voltage_count_path  = tdc_count_lower_path_pwd  + tdc_count_lower_voltage_path_list[i] 
        plot_TDC_SEPARATE(TDC_higher_voltage_count_path, TDC_lower_voltage_count_path, plot_path, i)
        # plot_TDC_TOGETHER(TDC_higher_voltage_count_path, TDC_lower_voltage_count_path, plot_path, i)
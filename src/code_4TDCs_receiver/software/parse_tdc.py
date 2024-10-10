from __future__ import print_function, division

import argparse

import csv
import json
import os
import numpy as np

from six import iteritems

from utilities import makedirs

transmitted_pattern   = []
tdc_cpu_measurements  = []
tdc_gpu_measurements  = []
tdc_fpga_measurements = []

cpu_data_path_list    = []
cpu_pred_bits         = [[],[],[],[]]
cpu_pred_percent      = []

gpu_data_path_list    = []
gpu_pred_bits         = [[],[],[],[]]
gpu_pred_percent      = []

fpga_data_path_list   = []
fpga_pred_bits        = [[],[],[],[]]
fpga_pred_percent     = []

def get_exp_params(base_dir):
    with open(base_dir + 'parameters.json') as f:
        return json.load(f)

def get_transmitted_pattern(basedir):
    for exp in sorted(os.listdir(basedir)):
        expdir = basedir + exp + '/'
        if not os.path.isdir(expdir):
            continue
        for name in sorted(os.listdir(expdir)):
            fulldir = expdir + name + '/'
            # print(fulldir)
            exp_params = get_exp_params(fulldir)
            
            # parse_tdc_measurements(fulldir)
            
            transmitted_pattern.append(exp_params['pattern'])
            # print(transmitted_pattern)


def parse_measurements(basedir, experi_type, tdc_measurements, data_path_list):
    expdir = basedir + experi_type + '/'
    for name in sorted(os.listdir(expdir)):
        fulldir = expdir + name + '/'
        print(fulldir)
        
        for file in os.listdir(fulldir):
            if file.endswith('.csv'):
                data_path_list.append(fulldir + file)
                
    data_path_list.sort()
    
    for data_list in data_path_list:
        with open( data_list, 'r' ) as file:
            csvreader = csv.reader(file)
            headers = next(csvreader, None)
            column = {}
            for h in headers:
                column[h] = []
            
            for row in csvreader:
                for h, v in zip(headers, row):
                    column[h].append(float(v))
            
            measurements = (column['tdc_measurement_0']) + (column['tdc_measurement_1']) + (column['tdc_measurement_2']) + (column['tdc_measurement_3'])
            tdc_measurements.append(measurements)
        
    # print(len(tdc_cpu_measurements))

def make_prediction(tdc_measurements_list,pred_bits):
    diff = 0 
    for i in range (len(tdc_measurements_list)):
        for j in range(0,len(tdc_measurements_list[0]),2):
            # print(tdc_measurements_list[j][i], tdc_measurements_list[j+1][i])
            diff = tdc_measurements_list[j][i] - tdc_measurements_list[j+1][i]
            # print(diff)
            # print("")
            if diff < -5.4: # may need to change later
                pred_bits[i].append(0)
                pred_bits[i].append(1)
            elif diff > 4.4: # may need to change later
               pred_bits[i].append(1)
               pred_bits[i].append(0)
        #     print(tdc_measurements_list[j][i])
            
    # print(tdc_measurements_list)
    print(pred_bits)

def get_results(pred_bits, ref_bits,pred_percent):  
    correct = 0
    for i in range(4):
        for j in range(len(pred_bits[i])):
            if(ref_bits[j] == pred_bits[i][j]):
                correct = correct + 1
            else:
                correct = correct + 0
        pred_percent.append(correct)
        correct = 0
        # pred_percent[i] = (pred_percent[i]/len(ref_bits)) * 100
    pred_percent = [x /len(ref_bits) * 100 for x in pred_percent]
    print("Percentage Correct: ", pred_percent)
         

if __name__ == "__main__":
    
    expdir = os.path.dirname(os.path.abspath(__file__)) + '/measurements/'
    
    ## getting pattern
    get_transmitted_pattern(expdir)
    cpu_transmitted_pattern = transmitted_pattern[0]
    fpga_transmitted_pattern = transmitted_pattern[1]
    gpu_transmitted_pattern = transmitted_pattern[2]
    
    ## CPU Results
    print('CPU Transmitted Pattern is ', cpu_transmitted_pattern)
    parse_measurements(expdir,'cpu', tdc_cpu_measurements, cpu_data_path_list)
    make_prediction(tdc_cpu_measurements,cpu_pred_bits)
    get_results(cpu_pred_bits,cpu_transmitted_pattern,cpu_pred_percent)
    
    print("")
    ## GPU Results
    print('GPU Transmitted Pattern is ', gpu_transmitted_pattern)
    parse_measurements(expdir,'gpu', tdc_gpu_measurements, gpu_data_path_list)
    make_prediction(tdc_gpu_measurements,gpu_pred_bits)
    get_results(gpu_pred_bits,gpu_transmitted_pattern,gpu_pred_percent)
    
    print("")
    ## FPGA Results
    print('FPGA Transmitted Pattern is ', fpga_transmitted_pattern)
    parse_measurements(expdir,'fpga', tdc_fpga_measurements, fpga_data_path_list)
    make_prediction(tdc_fpga_measurements,fpga_pred_bits)
    get_results(fpga_pred_bits,fpga_transmitted_pattern,fpga_pred_percent)
    
    
# steps
# get json file that has transmiited paatern done
# read 4 indivifual csv files done
# compare
# make prediction
# write prediction to ouput file stats.csv
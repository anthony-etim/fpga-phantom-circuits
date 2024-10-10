from __future__ import print_function, division

import argparse

import csv
import json
import os
import numpy as np
import re

from six import iteritems

from utilities import makedirs

transmitted_pattern_cpu   = []
transmitted_pattern_gpu   = []
transmitted_pattern_fpga  = []

tdc_cpu_measurements      = []
tdc_gpu_measurements      = []
tdc_fpga_measurements     = []

cpu_data_path_list        = []
cpu_pred_bits_tdc_zero    = []
cpu_pred_bits_tdc_one     = []
cpu_pred_bits_tdc_two     = []
cpu_pred_bits_tdc_three   = []
cpu_pred_percent          = [[],[],[],[]]

gpu_data_path_list        = []
gpu_pred_bits_tdc_zero    = []
gpu_pred_bits_tdc_one     = []
gpu_pred_bits_tdc_two     = []
gpu_pred_bits_tdc_three   = []
gpu_pred_percent          = [[],[],[],[]]

fpga_data_path_list       = []
fpga_pred_bits_tdc_zero   = []
fpga_pred_bits_tdc_one    = []
fpga_pred_bits_tdc_two    = []
fpga_pred_bits_tdc_three  = []
fpga_pred_percent         = [[],[],[],[]]

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]

def get_exp_params(base_dir):
    with open(base_dir + 'parameters.json') as f:
        return json.load(f)

def get_transmitted_pattern(basedir):
    for exp in sorted(os.listdir(basedir)):
        expdir = basedir + exp + '/'
        if not os.path.isdir(expdir):
            continue
        for name in sorted(os.listdir(expdir),key=natural_keys):
            fulldir = expdir + name + '/'
            print(fulldir)
            exp_params = get_exp_params(fulldir)
            
            # parse_tdc_measurements(fulldir)
            
            if (exp == 'cpu'):
                transmitted_pattern_cpu.append(exp_params['pattern'])
            elif (exp == 'gpu'):
                transmitted_pattern_gpu.append(exp_params['pattern'])
            elif (exp == 'fpga'):
                transmitted_pattern_fpga.append(exp_params['pattern'])
                
            # print(transmitted_pattern)


def parse_measurements(basedir, experi_type, tdc_measurements, data_path_list):
    # tdc_measurements = []
    expdir = basedir + experi_type + '/'
    for name in sorted(os.listdir(expdir)):
        fulldir = expdir + name + '/'
        # print(fulldir)
        
        for file in os.listdir(fulldir):
            if file.endswith('.csv'):
                data_path_list.append(fulldir + file)
                
    data_path_list.sort(key=natural_keys)

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
            
    # print((tdc_measurements))
    # print(len(tdc_measurements))
    # print(len(tdc_cpu_measurements))

def make_prediction(tdc_measurements_list,pred_bits_zero,pred_bits_one,pred_bits_two,pred_bits_three):
    diff = 0 
    # print((tdc_measurements_list))
    for i in range (0,len(tdc_measurements_list),2):
    # for i in range (0,64,2):
        for j in range(4):
            diff = tdc_measurements_list[i][j] - tdc_measurements_list[i+1][j]
            # print(tdc_measurements_list[i][j], tdc_measurements_list[i+1][j])
            # print(diff)
            # print("")
            # if diff < -5.4: # may need to change later
            if (diff > 0): # may need to change later
                if(j== 0):
                    pred_bits_zero.append(0)
                    pred_bits_zero.append(1)
                elif(j== 1):
                    pred_bits_one.append(0)
                    pred_bits_one.append(1)
                elif(j== 2):
                    pred_bits_two.append(0)
                    pred_bits_two.append(1)
                elif(j== 3):
                    pred_bits_three.append(0)
                    pred_bits_three.append(1)
                # pred_bits[i].append(0)
                # pred_bits[i].append(1)
            # elif diff > 4.4: # may need to change later
            elif (diff < 0): # may need to change later
                if(j== 0):
                    pred_bits_zero.append(1)
                    pred_bits_zero.append(0)
                elif(j== 1):
                    pred_bits_one.append(1)
                    pred_bits_one.append(0)
                elif(j== 2):
                    pred_bits_two.append(1)
                    pred_bits_two.append(0)
                elif(j== 3):
                    pred_bits_three.append(1)
                    pred_bits_three.append(0)
                    
            # elif (diff == 0): # may need to change later
            #     print("Diff equal to 0 exists")
            #     random_pred = np.random.randint(2)
            #     if(j== 0):
            #         pred_bits_zero.append(random_pred)
            #         pred_bits_zero.append(1-(random_pred))
            #     elif(j== 1):
            #         pred_bits_one.append(random_pred)
            #         pred_bits_one.append(1-(random_pred))
            #     elif(j== 2):
            #         pred_bits_two.append(random_pred)
            #         pred_bits_two.append(1-(random_pred))
            #     elif(j== 3):
            #         pred_bits_three.append(random_pred)
            #         pred_bits_three.append(1-(random_pred))
                # pred_bits[i].append(1)
                # pred_bits[i].append(0)
            # print(tdc_measurements_list[j][i])
            
    # print(tdc_measurements_list)
    # print("")
    # print('TDC0:   \t\t\t\t %s' % (pred_bits_zero))
    # print('TDC1:   \t\t\t\t %s' % (pred_bits_one))
    # print('TDC2:   \t\t\t\t %s' % (pred_bits_two))
    # print('TDC3:   \t\t\t\t %s' % (pred_bits_three))
    

def get_results(pred_bits_zero, pred_bits_one, pred_bits_two, pred_bits_three, ref_bits,pred_percent,bit_len,experiment_no):  
    
    pred_bits_zero = [pred_bits_zero[i:i + bit_len] for i in range(0, len(pred_bits_zero), bit_len)]
    pred_bits_one = [pred_bits_one[i:i + bit_len] for i in range(0, len(pred_bits_one), bit_len)]
    pred_bits_two = [pred_bits_two[i:i + bit_len] for i in range(0, len(pred_bits_two), bit_len)]
    pred_bits_three = [pred_bits_three[i:i + bit_len] for i in range(0, len(pred_bits_three), bit_len)]
    
    # print("")
    # print('TDC0:   \t\t\t\t %s' % (pred_bits_zero))
    # print('TDC1:   \t\t\t\t %s' % (pred_bits_one))
    # print('TDC2:   \t\t\t\t %s' % (pred_bits_two))
    # print('TDC3:   \t\t\t\t %s' % (pred_bits_three))
    
    # # pred_percent = [[]]*len(ref_bits)
    # print('REF:    \t\t\t\t %s' % (ref_bits))
    
    correct_zero = 0
    correct_one = 0
    correct_two = 0
    correct_three = 0
    
    for i in range(len(ref_bits)):
        for j in range(len(ref_bits[0])):
            if(ref_bits[i][j] == pred_bits_zero[i][j]):
                correct_zero = correct_zero + 1
            else:
                correct_zero = correct_zero + 0
        pred_percent[0].append(correct_zero)
        correct_zero = 0
        
        for j in range(len(ref_bits[0])):
            if(ref_bits[i][j] == pred_bits_one[i][j]):
                correct_one = correct_one + 1
            else:
                correct_one = correct_one + 0
        pred_percent[1].append(correct_one)
        correct_one = 0
        
        for j in range(len(ref_bits[0])):
            if(ref_bits[i][j] == pred_bits_two[i][j]):
                correct_two = correct_two + 1
            else:
                correct_two = correct_two + 0
        pred_percent[2].append(correct_two)
        correct_two = 0
        
        for j in range(len(ref_bits[0])):
            if(ref_bits[i][j] == pred_bits_three[i][j]):
                correct_three = correct_three + 1
            else:
                correct_three = correct_three + 0
        pred_percent[3].append(correct_three)
        correct_three = 0
    
    print("")
    for i in range(4):
        for j in range(experiment_no):
            pred_percent[i][j] = (pred_percent[i][j]/len(ref_bits[0])) * 100
        print("Percentage Correct for TDC %s: %s" % (i, pred_percent[i]))
        
    # print(pred_bits_zero)
    # pred_percent = [x /len(ref_bits) * 100 for x in pred_percent]
         

if __name__ == "__main__":
     # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port latency tester script.')
    parser.add_argument('-c', '--choice', type=int, required=True, help='Choice')
    args = parser.parse_args()
    
    expdir = os.path.dirname(os.path.abspath(__file__)) + '/measurements/'
    
    ## getting pattern
    get_transmitted_pattern(expdir)
    cpu_transmitted_pattern = transmitted_pattern_cpu
    gpu_transmitted_pattern = transmitted_pattern_gpu
    fpga_transmitted_pattern = transmitted_pattern_fpga
    
    ## CPU Results
    # print('CPU Transmitted Pattern is ', cpu_transmitted_pattern)
    # parse_measurements(expdir,'cpu', tdc_cpu_measurements, cpu_data_path_list)
    # make_prediction(tdc_cpu_measurements,cpu_pred_bits)
    # get_results(cpu_pred_bits,cpu_transmitted_pattern,cpu_pred_percent)
    
    if (args.choice == 0):
        print("")
        ## CPU Results
        experiment_no = len(cpu_transmitted_pattern)
        print(experiment_no)
        bit_len = len(cpu_transmitted_pattern[0])
        for i in range(experiment_no):
            print('CPU Experiment %d Transmitted Pattern is %s' % (i*2, cpu_transmitted_pattern[i]))
        parse_measurements(expdir,'cpu', tdc_cpu_measurements, cpu_data_path_list)
        make_prediction(tdc_cpu_measurements,cpu_pred_bits_tdc_zero,cpu_pred_bits_tdc_one,cpu_pred_bits_tdc_two,cpu_pred_bits_tdc_three)
        get_results(cpu_pred_bits_tdc_zero,cpu_pred_bits_tdc_one,cpu_pred_bits_tdc_two,cpu_pred_bits_tdc_three,cpu_transmitted_pattern,cpu_pred_percent,bit_len,experiment_no)
        
    # print('GPU Transmitted Pattern is ', gpu_transmitted_pattern)
    # parse_measurements(expdir,'gpu', tdc_gpu_measurements, gpu_data_path_list)
    # make_prediction(tdc_gpu_measurements,gpu_pred_bits)
    # get_results(gpu_pred_bits,gpu_transmitted_pattern,gpu_pred_percent)
    
    if (args.choice == 1):
        print("")
        ## GPU Results
        experiment_no = len(gpu_transmitted_pattern)
        print(experiment_no)
        bit_len = len(gpu_transmitted_pattern[0])
        for i in range(experiment_no):
            print('GPU Experiment %d Transmitted Pattern is %s' % (i*2, gpu_transmitted_pattern[i]))
        parse_measurements(expdir,'gpu', tdc_gpu_measurements, gpu_data_path_list)
        make_prediction(tdc_gpu_measurements,gpu_pred_bits_tdc_zero,gpu_pred_bits_tdc_one,gpu_pred_bits_tdc_two,gpu_pred_bits_tdc_three)
        get_results(gpu_pred_bits_tdc_zero,gpu_pred_bits_tdc_one,gpu_pred_bits_tdc_two,gpu_pred_bits_tdc_three,gpu_transmitted_pattern,gpu_pred_percent,bit_len,experiment_no)
        
    if (args.choice == 2):   
        print("")
        ## FPGA Results
        experiment_no = len(fpga_transmitted_pattern)
        print(experiment_no)
        bit_len = len(fpga_transmitted_pattern[0])
        for i in range(experiment_no):
            print('FPGA Experiment %d Transmitted Pattern is  %s'% (i*2, fpga_transmitted_pattern[i]))
        parse_measurements(expdir,'fpga', tdc_fpga_measurements, fpga_data_path_list)
        make_prediction(tdc_fpga_measurements,fpga_pred_bits_tdc_zero,fpga_pred_bits_tdc_one,fpga_pred_bits_tdc_two,fpga_pred_bits_tdc_three)
        get_results(fpga_pred_bits_tdc_zero,fpga_pred_bits_tdc_one,fpga_pred_bits_tdc_two,fpga_pred_bits_tdc_three,fpga_transmitted_pattern,fpga_pred_percent,bit_len,experiment_no)
        
# steps
# get json file that has transmiited paatern done
# read 4 indivifual csv files done
# compare
# make prediction
# write prediction to ouput file stats.csv
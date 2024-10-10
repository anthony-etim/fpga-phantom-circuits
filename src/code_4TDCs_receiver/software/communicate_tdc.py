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

# TRANSMITTER_SERIAL      = '210203A7DC87A'   # kc705-01 serial no
TRANSMITTER_SERIAL      = '210203A7D6C2A'   # kc705-02 serial no
# TRANSMITTER_SERIAL      = '210203A7DDF0A'   # ac701-01 serial no
# TRANSMITTER_SERIAL      = None              # Null

# TRANSMITTER_UART_PORT    = '/dev/ttyUSB2'    # kc705-01 uart port
TRANSMITTER_UART_PORT    = '/dev/ttyUSB4'    # kc705-02 uart port
# TRANSMITTER_UART_PORT    = '/dev/ttyUSB5'    # ac701-01 uart port
# TRANSMITTER_UART_PORT    = None

# RECEIVER_SERIAL       = '210203A7DC87A'   # kc705-01 serial no
# RECEIVER_SERIAL       = '210203A7D6C2A'   # kc705-02 serial no
RECEIVER_SERIAL       = '210203A7DDF0A'   # ac701-01 serial no

# RECEIVER_UART_PORT    = '/dev/ttyUSB2'    # kc705-01 uart port
# RECEIVER_UART_PORT    = '/dev/ttyUSB4'    # kc705-02 uart port
RECEIVER_UART_PORT    = '/dev/ttyUSB5'    # ac701-01 uart port

# FPGA_RECV = 'kc705'
FPGA_RECV = 'ac701'

# PART_TRANS = 'xc7a200tfbg676' # ac701 part no
PART_TRANS = 'xc7k325tffg900' # kc705 part no

def get_upload_tcl_dir():
    script = os.path.dirname(os.path.abspath(__file__))
    upload_tcl_dir = os.path.dirname(script) + '/Vivado/'
    return upload_tcl_dir

def get_receiver_build_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    build_dir = os.path.dirname(script) + '/build/'
    return build_dir

def get_transmitter_script_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    transmitter = os.path.dirname(script) 
    src = os.path.dirname(transmitter) + '/covert_transmitter/scripts/'
    return src

def list_to_bytes(list_vals, big_endian=True):
    conf_bytes = []
    def add_val(val, n_bytes):
        cur_bytes = []
        for i in range(n_bytes):
            cur_byte = (val & 0xFF)
            val >>= 8
            cur_bytes.append(cur_byte)
        if big_endian:
            cur_bytes = cur_bytes[::-1]
        conf_bytes.extend(cur_bytes)

    for list_val in list_vals:
        val, n_bytes = list_val
        add_val(val, n_bytes)

    return bytearray(conf_bytes)

def stress_cpus(ncpus):
    if ncpus == -1:
        print("Stressing with GPU")
        cmd = ['./gpu_burn', '1200'] # enable for as long as needed
        cwd = '/home/anthony/Documents/fpga-phantom-circuits/src/gpu_burn/gpu-burn-ace04173bf19d72178949b26a9874e2606cc354f'
        # cwd = '/home/anthony/Documents/fpga-phantom-circuits/src/gpu_burn/gpu-burn-35cfc4045d8435ffac20035bab31e8c412aa1cb4'
    else:
        print("Stressing with %d CPUs" % ncpus)
        if ncpus <= 0:
            return None
        cwd = None
        cmd = [
            'stress',
            '--cpu',
            '%d' % ncpus
        ]
    proc = subprocess.Popen(cmd, cwd=cwd, stdout=sys.stderr) # subprocess.DEVNULL
    return proc

def kill_proc(proc=None):
    subprocess.call(['pkill', '-TERM', 'stress'])
    subprocess.call(['pkill', '-TERM', 'gpu_burn'])
    if proc:
        subprocess.call(['pkill', '-TERM', '-P', str(proc.pid)])

def vary_cpu():
    print("Varying CPU load")
    com = Communicator()
    # com.upload()

    nthreads = multiprocessing.cpu_count()
    for ncpus in range(nthreads, nthreads-1, -1): # test no CPUs as base case
    # for ncpus in range(nthreads, 0, -1): # test no CPUs as base case
        parameters = {
            'measurements': 100,
            # 'repetitions': 4,
            'local_stressor_count_cycles': 15,
            'cpu_cores': ncpus,
            'heater_no': 8,
            'outdir': 'measurements/cpu/{}/'.format(ncpus),
        }
        com.measure(parameters)
        break

def vary_gpu():
    print("Varying GPU load")
    com = Communicator()
    com.upload()

    for ngpus in range(1, 2): # don't test empty
        parameters = {
            'measurements': 512,
            # 'repetitions': 4,
            'local_stressor_count_cycles': 15,
            'sleep': 3,
            'cpu_cores': -ngpus, # hack
            'heater_no': 8,
            'outdir': 'measurements/gpu/{}/'.format(ngpus),
        }
        com.measure(parameters)

def vary_fpga():
    print("Varying FPGA load")
    com = Communicator() # FIXME: set the right ports and serial numbers
    com.upload()
    kc705_no_trans = 14
    ac701_no_trans = 10
    trig_bit = 15
    heater_no = 0
    
    # for num_trans in range(ac701_no_trans,-1,-2):
    kc705_trans_mask = (1 << kc705_no_trans) - 1
        # kc705_trans_mask = (1 << 5) - 1
        # ac701_trans_mask = (1 << num_trans) - 1
    # for num_trans in range(ac701_no_trans,-1,-2):
        # ac701_trans_mask = (1 << 10) - 1
    # for local_stressor_count_cycles in range(18,18-1,-1):
    # for num_trans in range(kc705_no_trans,kc705_no_trans-1,-1):
    for num_heaters in range(heater_no,heater_no-1,-1):
    # for num_heaters in range(heater_no,-1,-1):
    # for measurements in range(1024, 128,-128):
        parameters = {
            'measurements':4000,
            # 'measurements': measurements,
            # 'repetitions': 4,
            'local_stressor_count_cycles': trig_bit,   
            # 'local_stressor_count_cycles': local_stressor_count_cycles,         
            # 'transmitter_mask': 0xffff,
            'transmitter_mask': kc705_trans_mask,
            # 'transmitter_mask': ac701_trans_mask,
            'trans_trig_bit': None,
            'heater_no': heater_no,
            # 'heater_no': 4,
            # 'outdir': 'measurements/fpga/{}/'.format(num_trans),
            'outdir': 'measurements/fpga/{}/'.format(num_heaters),
            # 'outdir': 'measurements/fpga/{}/'.format(measurements),
            # 'outdir': 'measurements/fpga/{}/'.format(local_stressor_count_cycles),
        }
        com.measure(parameters)

class Communicator(object):
    CNT_WIDTH = 32
    
    def __init__(self, recv_port=RECEIVER_UART_PORT , recv_serial_no=RECEIVER_SERIAL, trans_port=TRANSMITTER_UART_PORT, trans_serial_no=TRANSMITTER_SERIAL, baudrate=921600, parity=serial.PARITY_ODD, stopbits=serial.STOPBITS_TWO, bytesize=serial.EIGHTBITS):
        self.recv_serial = serial.Serial(port=recv_port, baudrate=baudrate, parity=parity, stopbits=stopbits, bytesize=bytesize)
        self.recv_serial.reset_input_buffer()
        self.recv_serial.reset_output_buffer()

        self.recv_serial_no = recv_serial_no
        self.trans_serial_no = trans_serial_no

        if trans_port is not None:
            self.trans_serial = serial.Serial(port=trans_port, baudrate=baudrate, parity=parity, stopbits=stopbits, bytesize=bytesize)
            self.trans_serial.reset_input_buffer()
            self.trans_serial.reset_output_buffer()
        else:
            self.trans_serial = None
    
    def __del__(self):
        self.recv_serial.close()

        if self.trans_serial:
            self.trans_serial.close()
            
    @staticmethod
    def upload_one(bitfile, serial=''):
        if not bitfile:
            raise ValueError("No bitfile to upload")
        uploadfile = get_upload_tcl_dir() + 'upload.tcl'
        vivado = "/tools/Xilinx/Vivado/2021.1/bin/vivado"

        cmd = [vivado, '-mode', 'batch', '-source', uploadfile,
               '-nojournal', '-nolog', '-tclargs', bitfile, serial]
        ret = subprocess.call(cmd)
        if ret != 0:
            raise Exception("System call returned %d. Aborting." % ret)
    
    def upload(self):
        self.upload_one(get_receiver_build_dir() + FPGA_RECV + '/synth_system.bit', self.recv_serial_no)

        if self.trans_serial:
            self.upload_one(get_transmitter_script_dir() + 'binaries/' + PART_TRANS + '/covert_transmitter_top.bit', self.trans_serial_no)

    def write_to_transmitter(self, bit, trig_bit, big_endian=True):
        if not self.trans_serial:
            print("WARNING: trying to write to transmitter which is not set")
            return
        to_write = list_to_bytes([(bit, 2)], big_endian)
        self.trans_serial.write(to_write)
        # print("trig bit type is ",type(trig_bit))
        if trig_bit is not None:
            shift = 1 << 5
            # print("shift type is ",type(shift))
            value = shift | (trig_bit & (shift - 1))
        else:
            value = 0
        self.trans_serial.write(list_to_bytes([(value, 1)], big_endian))

    def write_to_receiver(self, ser, local_stressor_count_cycles):
        self.uart_write_byte(ser, ADDR["SET_LOCAL_STRESSOR_COUNT_CYCLES_ADDR"])
        self.uart_write_4bytes(ser, local_stressor_count_cycles)
        # time.sleep(2)
            
    def measure(self, override_parameters):
        tx_bit_str = '0x' + secrets.token_hex(8)[8:]
        tx_bit = int(tx_bit_str, 16)  
        parameters = {
            'measurements': 500,
            'local_stressor_count_cycles': 15,
            # 'repetitions': 10,
            # 'pattern': int_to_manchester(0xff, 8), #int_to_manchester(0xf3ed1, 20),
            # 'pattern': int_to_manchester(tx_bit, 32), # random 32 bit number
            # 'pattern': int_to_manchester(0x1, 1), # random 32 bit number
            'pattern': [1, 0, 0, 1, 1, 0, 0, 1],
            # 'pattern': [0, 1],
            # 'pattern': [0, 0],
            # 'pattern': [1, 0],
            # 'pattern': [1, 0, 0, 1],
            'outdir': None,
            'cpu_cores': None,
            'sleep': 3,
            'transmitter_mask': 0xffff,
            'trans_trig_bit': None,
            'heater_no': 4,
        }
        for k in override_parameters.keys():
            if k not in parameters:
                raise ValueError("%s not in receiver parameters" % k)
            parameters[k] = override_parameters[k]
        
        if parameters['cpu_cores'] is not None and 'sleep' not in parameters:
            parameters['sleep'] = 3

        if parameters['outdir']:
            makedirs(parameters['outdir'])
            with open(parameters['outdir'] + 'parameters.json', 'w') as outfile:
                json.dump(parameters, outfile, indent=4)

        self.communicate_pattern(parameters)
    
    def communicate_pattern(self, params):
        print("Communicating with", params)
        outdir = params.get('outdir', None)
        pattern = params['pattern']
        num_measurements = params['measurements']
        local_stressor_count_cycles = params['local_stressor_count_cycles']
        repetitions = params.get('repetitions', 1)
        heater_no = params['heater_no']
        sleep = params.get('sleep', 0)
        is_cpu = params.get('cpu_cores', None) is not None
        if is_cpu:
            transmit_mask = params['cpu_cores']
        else:
            transmit_mask = params['transmitter_mask']
            trans_trig_bit = params.get('trans_trig_bit', None)
        
        pat_len = len(pattern)
        two_bits_tdc_0 = []
        two_bits_tdc_1 = []
        two_bits_tdc_2 = []
        two_bits_tdc_3 = []
        plot_path = '/home/anthony/Documents/fpga-phantom-circuits/src/code_4TDCs_receiver/Vivado/plots/'
        for i, bit in enumerate(pattern):
            measurements_all      = [[],[],[],[]]
            measurements_all_new  = [[],[],[],[]]
            measurements_on_all   = [[],[],[],[]]
            measurements_off_all  = [[],[],[],[]]
            sum_delta             = []
            print("Transmitting %d as the %d/%d bit and sleeping for %d" % (bit, i+1, pat_len, sleep))
            proc = None
            if is_cpu:
                if bit:
                    proc = stress_cpus(transmit_mask)
            else:
                self.write_to_transmitter(transmit_mask if bit else 0, trans_trig_bit)

            time.sleep(sleep+2)
            for j in range(repetitions):
                print("Repetition %d/%d for %d/%d bit = %d" % (j+1, repetitions, i+1, pat_len, bit))                
                self.write_to_receiver(self.recv_serial, local_stressor_count_cycles)
                measurements = self.read_from_receiver(self.recv_serial, heater_no, num_measurements, local_stressor_count_cycles,'test')                
                ################################################
                # measurements = measurements[:,3:-4]
                # measurements = measurements[:,1:-2]
                # measurements = np.mean(measurements, axis=1)
                tmp = measurements.tolist() # TAKE OUT LATER
                # print(tmp[3])
                # print("")
                # print(len(tmp[3]))
                # print("")
                # return
                measurements = measurements[:,:-2]

                # measurements = measurements[:,1:-3] 
                
                # measurements = measurements[:,3:-3]
                # measurements = measurements[:,4:-6]
                measurements = measurements.tolist() 

                two_bits_tdc_0.append(measurements[0])
                two_bits_tdc_1.append(measurements[1])
                two_bits_tdc_2.append(measurements[2])
                two_bits_tdc_3.append(measurements[3])

                for k in range(4):
                    for l in range(len(measurements[k])):
                        if(l%2 == 0):
                            measurements_on_all[k].append(measurements[k][l])
                        else:
                            measurements_off_all[k].append(measurements[k][l])

                # measurements = [sorted(x)  for x in measurements]   
                # measurements_off_all[k].append(measurements[k][0:(int(num_measurements/2) - 1)])
                # measurements_on_all[k].append(measurements[k][int(num_measurements/2)-1:])
                
                # print(measurements[0])
                # print(measurements_on_all[0])
                print(np.mean(measurements_off_all[3]))
                print("")
                print(np.mean(measurements_on_all[3]))
                # sys.exit()
                #################################################
                

                # for k in range(4):
                #     measurements_all[k] = [measurements[k][l:l + 2] for l in range(0, len(measurements[k]), 2)]
                ################################################
                # print(measurements_all[2])
                # print(len(measurements_all[2]))
                # # for i in range(len(measurements_all_new[0])):
                # #     print((len(measurements_all[0][i])))
                # return
                # ################################################
                # for k in range(4):
                #     for l in range(len(measurements_all[k])):
                #     # # for l in range(4):
                #     # # for l in range(2):
                #         avg = np.average(measurements_all[k][l])
                #         measurements_all_new[k].append(avg)
                # print(measurements_all_new[0])
                # print(len(measurements_all_new[0]))
                # print("")
                # return
                ################################################
                
                # measurements_all_new  = measurements
                # sum = 0
                # for k in range(4):
                #     for l in range(0,len(measurements_all_new[k]),2):
                #         # if(measurements_all_new[k][0] > measurements_all_new[k][1]):
                #         sum = sum + measurements_all_new[k][l+1] - measurements_all_new[k][l]
                #         # else:
                #         # sum = sum + measurements_all_new[k][l+1] - measurements_all_new[k][l]
                #     sum_delta.append((sum))
                #     sum = 0

                # for k in range(4):
                #     for l in range(len(measurements_all_new[k])):
                #         if(measurements_all_new[k][0] < measurements_all_new[k][1]):
                #             if(l%2 == 0):
                #                 measurements_off_all[k].append(measurements_all_new[k][l])
                #             else:
                #                 measurements_on_all[k].append(measurements_all_new[k][l])
                #         else:
                #             if(l%2 == 1):
                #                 measurements_off_all[k].append(measurements_all_new[k][l])
                #             else:
                #                 measurements_on_all[k].append(measurements_all_new[k][l])
                            
                
                # measurements_all = np.array(measurements_all)    measurements_off_all
                # print(measurements_all[0])    
                
                # for i in range(len(measurements_all[0])):           
                #     print(measurements_all[0][i])
                
                # print((measurements_off_all[0]))
                # print("")
                # print((measurements_on_all[0]))
                # return
            
                # for m in range(len(measurements[0])):
                # print(measurements_all[0])
                # print("")
                # print(len(measurements_all[0]))
                # # print(measurements_on_all[0][0:199])
                # return
                # measurements = np.mean(measurements[:,:-2], axis=1)
                # measurements = measurements.tolist()
                # measurements_all.append(measurements)
                
                sum_measurements_off_all = [np.mean(arr) for arr in measurements_off_all]     
                sum_measurements_on_all  = [np.mean(arr) for arr in measurements_on_all]
                # sum_measurements_off_all = [np.sum(arr) for arr in measurements_off_all]     
                # sum_measurements_on_all  = [np.sum(arr) for arr in measurements_on_all]
                # sum_measurements_off_all = [(np.sum(arr)/int(num_measurements/2)) for arr in measurements_off_all]     
                # sum_measurements_on_all  = [(np.sum(arr)/int(num_measurements/2)) for arr in measurements_on_all]
                # sum_measurements_off_all = [x / (int(num_measurements/2) ) for x in sum_measurements_off_all]
                # sum_measurements_on_all  = [x / (int(num_measurements/2))  for x in sum_measurements_on_all]
                # print(sum_measurements_off_all) 
                # print(sum_measurements_on_all)     

                # delta = [abs(x - y) for x, y in zip(sum_measurements_on_all, sum_measurements_off_all)]
                # delta = [np.sum(x) for x in delta]
                # delta = [np.mean(x) for x in sum_measurements_on_all]
                delta = [np.mean(arr) for arr in measurements]
                # delta = [abs(x) for x in delta]
                # delta = [np.mean(x)  for x in measurements_all_new]
                #########################################

                # measurements_on_all  = [np.mean(x) for x in measurements_on_all]
                # measurements_off_all = [np.mean(x) for x in measurements_off_all]
                # delta = [x - y for x, y in zip(measurements_on_all, measurements_off_all)]

                # delta = [np.mean(x) for x in measurements]



                #########################################
                # heater_delta =  [x - y for x, y in zip(np.array(measurements_on_all), np.array(measurements_off_all))]
                # delta = [(np.sum(z)) for z in heater_delta]
                #########################################

                # delta = [(np.sum(z)) for z in heater_delta]
                # delta = [(np.mean(z)) for z in heater_delta]
                # print(measurements_on_all)
                # print(measurements_off_all)
                # sys.exit()
                

                # delta = [x / 2 for x in sum_delta]
                # delta = [x / (int(num_measurements/2)) for x in sum_delta]
                # delta = [x for x in sum_delta]
                # delta = [x / num_measurements for x in sum_delta]
                

                # delta = [abs(x) / 2  for  x in sum_delta]
                # delta = [abs(x) for x in sum_delta]
                # # return
                # print(sum_delta)
                print(delta)
                # print("")
                # # # return
                
                extra_data = {
                    'transmitter_mask': transmit_mask,
                    'transmitter_bit': bit,
                }
                if outdir:
                    outfile = '%s/%d_%d.csv' % (outdir, i, j) # original
                else:   
                    outfile = None
                if outfile and os.path.exists(outfile):
                    if not params.get('overwrite', True):
                        print("File %s exists. not overwriting." % outfile)
                        outfile = None
                DataParser.write_tdc_measurements(delta, repetitions, outfile, extra_data)
                # time.sleep(sleep)
                
            if is_cpu:
                kill_proc(proc)
                time.sleep(sleep)
        if not is_cpu:
            # to prevent damage
            self.write_to_transmitter(0, trans_trig_bit)
        
        ## Debug output
        two_bits_tdc_3[0].sort()
        two_bits_tdc_3[1].sort()
        print(" -- ")
        print("HEATER ON")
        bit_0_on = np.mean(two_bits_tdc_3[0][int(num_measurements/2):])
        bit_1_on = np.mean(two_bits_tdc_3[1][int(num_measurements/2):])
        print(bit_0_on)
        print(bit_1_on)
        print(" -- ")
        print("HEATER OFF")
        bit_0_off = np.mean(two_bits_tdc_3[0][0:(int(num_measurements/2))])
        bit_1_off = np.mean(two_bits_tdc_3[1][0:(int(num_measurements/2))])
        print(bit_0_off)
        print(bit_1_off)
        # tdc_3_diff = np.mean(two_bits_tdc_3[0][int(num_measurements/2)-1:]) -  np.mean(two_bits_tdc_3[1][int(num_measurements/2)-1:])
        print(" -- ")
        # diff_on = bit_0_on - bit_1_on
        # diff_off = bit_0_off - bit_1_off
        bit_0_diff = bit_0_on - bit_0_off
        bit_1_diff = bit_1_on - bit_1_off
        bit_0 = str(pattern[0])
        bit_1 = str(pattern[1])
        print("HEATER " + bit_0 + " BIT ON - OFF", bit_0_diff)
        print("HEATER " + bit_1 + " BIT ON - OFF", bit_1_diff)
        
        if (heater_no == 0):
            ########################################
            ## TDC COUNTS HEATER ON AND OFF TOGETHER
            
            print(pattern)
            bit_0 = str(pattern[0])
            bit_1 = str(pattern[1])
            
            ## TDC 0
            plt.hist(two_bits_tdc_0[0], color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(two_bits_tdc_0[1], color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()

            tdc_no = 0
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 1
            plt.hist(two_bits_tdc_1[0], color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(two_bits_tdc_1[1], color='blue', label= bit_1 + ' Bit', bins='auto', alpha=0.8)
            plt.legend()

            tdc_no = 1
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 2
            plt.hist(two_bits_tdc_2[0], color='red', label= bit_0 + ' Bit', bins='auto', alpha=0.8)
            plt.hist(two_bits_tdc_2[1], color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()

            tdc_no = 2
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 3
            plt.hist(two_bits_tdc_3[0], color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(two_bits_tdc_3[1], color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()

            tdc_no = 3
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            # sys.exit()
            
            #################################
            ## TDC COUNTS_DELTA HEATER ON - OFF 
            two_bits_tdc_0[0].sort()
            two_bits_tdc_0[1].sort()
            two_bits_tdc_1[0].sort()
            two_bits_tdc_1[1].sort()
            two_bits_tdc_2[0].sort()
            two_bits_tdc_2[1].sort()
            two_bits_tdc_3[0].sort()
            two_bits_tdc_3[1].sort()
            ## TDC 0
            bit_0_delta = np.array(two_bits_tdc_0[0][int(num_measurements/2):]) - np.array(two_bits_tdc_0[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_0[1][int(num_measurements/2):]) - np.array(two_bits_tdc_0[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 0
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
            
            ## TDC 1
            bit_0_delta = np.array(two_bits_tdc_1[0][int(num_measurements/2):]) - np.array(two_bits_tdc_1[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_1[1][int(num_measurements/2):]) - np.array(two_bits_tdc_1[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 1
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
            
            
            ## TDC 2
            bit_0_delta = np.array(two_bits_tdc_2[0][int(num_measurements/2):]) - np.array(two_bits_tdc_2[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_2[1][int(num_measurements/2):]) - np.array(two_bits_tdc_2[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 2
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
        
            
            ## TDC 3
            bit_0_delta = np.array(two_bits_tdc_3[0][int(num_measurements/2):]) - np.array(two_bits_tdc_3[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_3[1][int(num_measurements/2):]) - np.array(two_bits_tdc_3[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 3
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()

        else:
            #################################
            ## TDC COUNTS HEATER ON AND OFF SEPARATE
            
            two_bits_tdc_0[0].sort()
            two_bits_tdc_0[1].sort()
            two_bits_tdc_1[0].sort()
            two_bits_tdc_1[1].sort()
            two_bits_tdc_2[0].sort()
            two_bits_tdc_2[1].sort()
            two_bits_tdc_3[0].sort()
            two_bits_tdc_3[1].sort()
            # print(len(two_bits_tdc_3[0]))
            print(pattern)
            bit_0 = str(pattern[0])
            bit_1 = str(pattern[1])
            
            ## TDC 0
            fig, axes = plt.subplots(1, 2, sharey=True, tight_layout=True)
            axes[0].hist(two_bits_tdc_0[0][0:(int(num_measurements/2))], color='red', label= bit_0 + ' Bit HEATER OFF',  bins='auto', alpha=0.8)
            axes[0].hist(two_bits_tdc_0[1][0:(int(num_measurements/2))], color='blue', label= bit_1 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            
            axes[1].hist(two_bits_tdc_0[0][int(num_measurements/2):], color='red', label= bit_0 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[1].hist(two_bits_tdc_0[1][int(num_measurements/2):], color='blue', label= bit_1 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[0].legend()
            axes[1].legend()

            tdc_no = 0
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 1
            fig, axes = plt.subplots(1, 2, sharey=True, tight_layout=True)
            axes[0].hist(two_bits_tdc_1[0][0:(int(num_measurements/2))], color='red', label= bit_0 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            axes[0].hist(two_bits_tdc_1[1][0:(int(num_measurements/2))], color='blue', label= bit_1 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            
            axes[1].hist(two_bits_tdc_1[0][int(num_measurements/2):], color='red', label= bit_0 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[1].hist(two_bits_tdc_1[1][int(num_measurements/2):], color='blue', label= bit_1 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[0].legend()
            axes[1].legend()

            tdc_no = 1
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 2
            fig, axes = plt.subplots(1, 2, sharey=True, tight_layout=True)
            axes[0].hist(two_bits_tdc_2[0][0:(int(num_measurements/2))], color='red', label= bit_0 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            axes[0].hist(two_bits_tdc_2[1][0:(int(num_measurements/2))], color='blue', label= bit_1 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            
            axes[1].hist(two_bits_tdc_2[0][int(num_measurements/2):], color='red', label= bit_0 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[1].hist(two_bits_tdc_2[1][int(num_measurements/2):], color='blue', label= bit_1 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[0].legend()
            axes[1].legend()

            tdc_no = 2
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
            
            ## TDC 3
            fig, axes = plt.subplots(1, 2, sharey=True, tight_layout=True)
            axes[0].hist(two_bits_tdc_3[0][0:(int(num_measurements/2))], color='red', label= bit_0 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            axes[0].hist(two_bits_tdc_3[1][0:(int(num_measurements/2))], color='blue', label= bit_1 + ' Bit HEATER  OFF',  bins='auto', alpha=0.8)
            
            axes[1].hist(two_bits_tdc_3[0][int(num_measurements/2):], color='red', label= bit_0 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[1].hist(two_bits_tdc_3[1][int(num_measurements/2):], color='blue', label= bit_1 + ' Bit HEATER ON',  bins='auto', alpha=0.8)
            axes[0].legend()
            axes[1].legend()

            tdc_no = 3
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_histogram.pdf')
            plt.clf()
        
        #################################
            ## TDC COUNTS_DELTA HEATER ON - OFF 
            ## TDC 0
            # print(two_bits_tdc_0[0])
            # print((two_bits_tdc_0[0][int(num_measurements/2)-1:]))
            # print((two_bits_tdc_0[0][0:(int(num_measurements/2) - 1)]))
            bit_0_delta = np.array(two_bits_tdc_0[0][int(num_measurements/2):]) - np.array(two_bits_tdc_0[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_0[1][int(num_measurements/2):]) - np.array(two_bits_tdc_0[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 0
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
            
            ## TDC 1
            bit_0_delta = np.array(two_bits_tdc_1[0][int(num_measurements/2):]) - np.array(two_bits_tdc_1[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_1[1][int(num_measurements/2):]) - np.array(two_bits_tdc_1[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 1
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
            
            
            ## TDC 2
            bit_0_delta = np.array(two_bits_tdc_2[0][int(num_measurements/2):]) - np.array(two_bits_tdc_2[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_2[1][int(num_measurements/2):]) - np.array(two_bits_tdc_2[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 2
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
        
            
            ## TDC 3
            bit_0_delta = np.array(two_bits_tdc_3[0][int(num_measurements/2):]) - np.array(two_bits_tdc_3[0][0:(int(num_measurements/2))])
            bit_1_delta = np.array(two_bits_tdc_3[1][int(num_measurements/2):]) - np.array(two_bits_tdc_3[1][0:(int(num_measurements/2))])
            plt.hist(bit_0_delta, color='red', label= bit_0 + ' Bit',  bins='auto', alpha=0.8)
            plt.hist(bit_1_delta, color='blue', label= bit_1 + ' Bit',  bins='auto', alpha=0.8)
            plt.legend()
        
            tdc_no = 3
            plt.title('TDC ' + str(tdc_no) + ' COUNTS')
            plt.savefig(plot_path + 'tdc_'+  str(tdc_no) + '_counts_delta_histogram.pdf')
            plt.clf()
            
        
        
        
        #################################################
        # one_tdc_1 = two_bits_tdc_1[0][int(num_measurements/2)-1:]
        # zero_tdc_1 = two_bits_tdc_1[1][int(num_measurements/2)-1:]
        # temp_one = 0
        # temp_zero = 0
        # diff = 0
        # total = 0
        # for i in range(0, 256):
        #     for j in range(len(one_tdc_1)):
        #         if(one_tdc_1[j] == i):
        #             temp_one += 1
        #         if(zero_tdc_1[j] == i):
        #             temp_zero += 1
                
        #         diff = abs(temp_one-temp_zero)
        #         total += diff
        
        # print("----")
        # print(total)
        
        # one_tdc_1 = two_bits_tdc_1[0][0:(int(num_measurements/2) - 1)]
        # zero_tdc_1 = two_bits_tdc_1[1][0:(int(num_measurements/2) - 1)]
        # temp_one = 0
        # temp_zero = 0
        # diff = 0
        # total = 0
        # for i in range(0, 256):
        #     for j in range(len(one_tdc_1)):
        #         if(one_tdc_1[j] == i):
        #             temp_one += 1
        #         if(zero_tdc_1[j] == i):
        #             temp_zero += 1
                
        #         diff = abs(temp_one-temp_zero)
        #         total += diff
        
        # print("----")
        # print(total)
        
                    
    ########################################
    ## TDC INITIALIZATION
    ########################################
    
    def read_from_receiver(self, ser, heater_no, measures, local_stressor_count_cycles, mesg):   
        # Set up TDC
        self.set_up_tdc(ser, measures)
        self.reset_tdc(ser)
        self.enable_ro_heater(ser, heater_no)  # heater_no heaters out of 8  enabled
        self.start_tdc(ser)
        time.sleep(11)
        
        # 4 TDCs, measures+2 records
        data = np.zeros((4, measures+2))
        for i in range(4):
            for j in range(measures+2):
                data[i][j] = self.read_tdc(ser, i)
        # out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(self.getTimeStamp(), measures, mesg)
        # np.savez(out_data_file, data=data) # remember to uncomment
        # print (data, data.shape)
        # print ("Average : ", np.mean(data[:,:-2], axis=1))
        # data = data.tolist()
        # print(data[2])
        # print(len(data[2]))
        return data
    
    def getTimeStamp(self):
        time_now = str(datetime.datetime.now())
        time_now = time_now[0:10]+"_"+time_now[11:13]+"-"+time_now[14:16]+"-"+time_now[17:19]
        return time_now

    def uart_write_byte(self, ser, val):
        # print ("Sending %d  %x"%(val, val))
        ser.write (val.to_bytes (1, byteorder='big'))

    def uart_write_4bytes(self, ser, val):
        # print ("Sending %d  %x"%(val, val))
        ser.write ( ((val >> 24) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( ((val >> 16) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( ((val >> 8) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( (val & 0xFF).to_bytes (1, byteorder='big') )

    def set_up_tdc (self, ser, measures, config = 0xff, coarse = 0x1f, fine = 0xd, nTDCs = 4):  # 0x1A for kc705-01 and 0x1F for kc705-02, 0x5 0x2, 0x9 0x2, 0xb 0x2, 0xc 0x2 for ac701
        print ("Setting up %d TDCs from FPGA"%(nTDCs))
        # Number of measurements
        self.uart_write_byte(ser, ADDR["SET_TDC_MEASUREMENT_NUM_ADDR"])
        self.uart_write_4bytes(ser, measures)
        # Config
        self.uart_write_byte(ser, ADDR["SET_TDC_CONFIG_ADDR"])
        self.uart_write_byte(ser, config)
        # Coarse
        self.uart_write_byte(ser, ADDR["SET_TDC_COARSE_ADDR"])
        self.uart_write_byte(ser, coarse)
        # Fine
        self.uart_write_byte(ser, ADDR["SET_TDC_FINE_ADDR"])
        self.uart_write_byte(ser, fine)

    def reset_tdc(self, ser):
        self.uart_write_byte(ser, ADDR["SET_TDC_RESET_ADDR"])

    def start_tdc(self, ser):
        self.uart_write_byte(ser, ADDR["SET_TDC_START_ADDR"])

    def read_tdc (self, ser, tdc_idx):
        if (tdc_idx == 0):
            self.uart_write_byte(ser, ADDR["GET_TDC0_BYTE_ADDR"])
        elif (tdc_idx == 1):
            self.uart_write_byte(ser, ADDR["GET_TDC1_BYTE_ADDR"])
        elif (tdc_idx == 2):
            self.uart_write_byte(ser, ADDR["GET_TDC2_BYTE_ADDR"])
        elif (tdc_idx == 3):
            self.uart_write_byte(ser, ADDR["GET_TDC3_BYTE_ADDR"])
        # tdc_meas = ser.read()
        tdc_meas = self.read32bitData(ser)
        # tdc_meas = ord(tdc_meas)
        # print ("tdc %d measurement :  %d  %s "%(tdc_idx, tdc_meas, hex(tdc_meas)))
        return tdc_meas
    
    def read32bitData(self, ser): 
        data = 0
        for i in range(4):
            tmp = ser.read()
            data = data + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            # time.sleep(0.2)
        return data

    def enable_ro_heater (self, ser, num_heaters):
        self.uart_write_byte(ser, ADDR["SET_RO_HEATER_ON_ADDR"])
        def set_heater_enable_val (a):
            base = 0xFF
            res = ((base << a) & base) ^ base
            print ("The RO heater enable value is  ", "{:08b}".format(res))
            return res
        self.uart_write_byte(ser, set_heater_enable_val(num_heaters))
        # time.sleep(3) # remember to uncomment

    def disable_ro_heater (self, ser):
        self.uart_write_byte(ser, ADDR["SET_RO_HEATER_OFF_ADDR"])
        # time.sleep(3) # remember to uncomment sleep 300 originally

# def read_from_receiver(ser, measures, mesg):
#     # Set up TDC
#     # for a in range(0x0,0xff):
#         # config = a
#         for b in range(0x0,0x20):
#         # for b in range(0x1a,0x1b):
#             coarse = b
#             for c in range(0x0,0x20):
#             # for c in range(0x1f,0x20):
#                 fine = c
#                 print("")
#                 # print("config = ", config)
#                 print("coarse = ", hex(coarse))
#                 print("fine = ", hex(fine))
#                 set_up_tdc(ser, measures, config = 0xff, coarse = coarse, fine = fine, nTDCs = 4)
#                 reset_tdc(ser)
#                 start_tdc(ser)
#                 # 4 TDCs, measures+2 records
#                 data = np.zeros((4, measures+2))
#                 for i in range(4):
#                     for j in range(measures+2):
#                         data[i][j] = read_tdc(ser, i)
#                 out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(getTimeStamp(), measures, mesg)
#                 # np.savez(out_data_file, data=data)
#                 print (data, data.shape)
#                 print ("Average : ", np.mean(data[:,:-2], axis=1))

if __name__ == '__main__':
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port latency tester script.')
    parser.add_argument('-c', '--choice', type=int, required=True, help='Choice')
    parser.add_argument('-n', '--nummeasures', default=5, type=int, required=False, help='Num measures.')
    parser.add_argument('--mesg', default="", type=str, required=False, help='Message from user.')
    args = parser.parse_args()

    import atexit
    atexit.register(kill_proc)
    
    if (args.choice == 0):
        # vary cpu experiment
        vary_cpu()
    elif (args.choice == 1):
        # vary gpu experiment
        vary_gpu() 
    elif (args.choice == 2):
        # vary fpga experiment
        vary_fpga()
    else:
        print ("Please make your choice!")


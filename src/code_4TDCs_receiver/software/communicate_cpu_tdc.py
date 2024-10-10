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
from address import *
from utilities import *

# RECEIVER_SERIAL       = '210203A7DC87A'   # kc705-01 serial no
# RECEIVER_SERIAL       = '210203A7D6C2A'   # kc705-02 serial no
RECEIVER_SERIAL       = '210203A7DDF0A'   # ac701-01 serial no

# RECEIVER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
# RECEIVER_UART_PORT    = '/dev/ttyUSB3'    # kc705-02 uart port
RECEIVER_UART_PORT    = '/dev/ttyUSB6'    # ac701-01 uart port

PART = 'xc7a200tfbg676' # ac701 part no
# PART = 'xc7k325tffg900' # kc705 part no

FPGA = 'ac701'
# FPGA = 'kc705'

def get_script_dir():
    # return os.path.dirname(os.path.abspath(__file__)) + '/'
    return '../Vivado/'

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
            'measurements': 1200,
            # 'repetitions': 4,
            'cpu_cores': ncpus,
            'outdir': 'measurements/cpu/{}/'.format(ncpus),
        }
        com.measure(parameters)
        break

def vary_gpu():
    print("Varying GPU load")
    com = Communicator()
    # com.upload()

    for ngpus in range(1, 2): # don't test empty
        parameters = {
            'measurements': 1500,
            # 'repetitions': 4,
            'sleep': 3,
            'cpu_cores': -ngpus, # hack 
            'outdir': 'measurements/gpu/{}/'.format(ngpus),
        }
        com.measure(parameters)

class Communicator(object):
    CNT_WIDTH = 32

    def __init__(self, port=RECEIVER_UART_PORT,  baudrate=115200, parity=serial.PARITY_ODD):
        self.recv_serial = serial.Serial(port=port, baudrate=baudrate, parity=parity)
        self.recv_serial.reset_input_buffer()
        self.recv_serial.reset_output_buffer()

    def __del__(self):
        self.recv_serial.close()

    @staticmethod
    def upload_one(bitfile):
        if not bitfile:
            raise ValueError("No bitfile to upload")
        uploadfile = get_script_dir() + 'upload.tcl'
        vivado = "/tools/Xilinx/Vivado/2021.1/bin/vivado"

        cmd = [vivado, '-mode', 'batch', '-source', uploadfile,
               '-nojournal', '-nolog', '-tclargs', bitfile, RECEIVER_SERIAL]
        ret = subprocess.call(cmd)
        if ret != 0:
            raise Exception("System call returned %d. Aborting." % ret)

    def upload(self):
        # self.upload_one(get_script_dir() + 'binaries/' + PART + '/covert_receiver_top.bit')
        self.upload_one('../build/'+ FPGA + '/synth_system.bit')
    
    def write_to_receiver(self, ser, bit):
        if bit:
            self.enable_ro_heater(ser, 8)  # 8 heaters out of 8  enabled
        else:
            self.disable_ro_heater(ser)
            
    def measure(self, override_parameters):
        parameters = {
            'measurements': 500,
            'repetitions': 1,
            # 'pattern': int_to_manchester(0xab, 8), #int_to_manchester(0xf3ed1, 20),
            # 'pattern': int_to_manchester(0xf3ed1, 20),
            'pattern': int_to_manchester(0xab, 8),
            'outdir': None,
            'cpu_cores': 0,
            'sleep': 3,
        }
        for k in override_parameters.keys():
            if k not in parameters:
                raise ValueError("%s not in receiver parameters" % k)
            parameters[k] = override_parameters[k]

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
            repetitions = params.get('repetitions', 1)
            sleep = params.get('sleep', 0)
            transmit_mask = params['cpu_cores']
            pat_len = len(pattern)
            
            ser = serial.Serial(
                port=args.port,
                baudrate=args.baud,
                parity=serial.PARITY_ODD,
                stopbits=serial.STOPBITS_TWO,
                bytesize=serial.EIGHTBITS
            )
             
            for i, bit in enumerate(pattern):
                print("Transmitting %d as the %d/%d bit and sleeping for %d" % (bit, i+1, pat_len, sleep))
                if bit:
                    proc = stress_cpus(transmit_mask)
                else:
                    proc = None

                time.sleep(sleep)
                for j in range(repetitions):
                    print("Repetition %d/%d for %d/%d bit = %d" % (j+1, repetitions, i+1, pat_len, bit))
                    self.write_to_receiver(ser, bit)
                    measurements = self.test(ser, num_measurements,'test')
                    extra_data = {
                        'transmitter_mask': transmit_mask,
                        'transmitter_bit': bit,
                    }
                    if outdir:
                        outfile = '%s/%d_%d.csv' % (outdir, i, j)
                    else:
                        outfile = None
                    if outfile and os.path.exists(outfile):
                        if not params.get('overwrite', True):
                            print("File %s exists. not overwriting." % outfile)
                            outfile = None
                    # DataParser.write_tdc_measurements(measurements, outfile, extra_data)
                    
                kill_proc(proc)
                time.sleep(sleep)
                    
    ########################################
    ## TDC INITIALIZATION
    ########################################
    def test(self, ser, measures, mesg):
        # Set up TDC
        self.set_up_tdc(ser, measures)
        self.reset_tdc(ser)
        self.start_tdc(ser)
        # 4 TDCs, measures+2 records
        data = np.zeros((4, measures+2))
        for i in range(4):
            for j in range(measures+2):
                data[i][j] = self.read_tdc(ser, i)
        out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(self.getTimeStamp(), measures, mesg)
        # np.savez(out_data_file, data=data) # remember to uncomment
        print (data, data.shape)
        print ("Average : ", np.mean(data[:,:-2], axis=1))
        return data

    def getTimeStamp(self):
        time_now = str(datetime.datetime.now())
        time_now = time_now[0:10]+"_"+time_now[11:13]+"-"+time_now[14:16]+"-"+time_now[17:19]
        return time_now

    def uart_write_byte(self,ser, val):
        # print ("Sending %d  %x"%(val, val))
        ser.write (val.to_bytes (1, byteorder='big'))

    def uart_write_4bytes(self,ser, val):
        # print ("Sending %d  %x"%(val, val))
        ser.write ( ((val >> 24) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( ((val >> 16) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( ((val >> 8) & 0xFF).to_bytes (1, byteorder='big') )
        ser.write ( (val & 0xFF).to_bytes (1, byteorder='big') )

    def set_up_tdc (self, ser, measures, config = 0xff, coarse = 0x0c, fine = 0x02, nTDCs = 4):  # 0x1A for kc705-01 and 0x1F for kc705-02, 0x5 0x2, 0x9 0x2, 0xb 0x2, 0xc 0x2 for ac701
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

    def read_tdc(self, ser, tdc_idx):
        if (tdc_idx == 0):
            self.uart_write_byte(ser, ADDR["GET_TDC0_BYTE_ADDR"])
        elif (tdc_idx == 1):
            self.uart_write_byte(ser, ADDR["GET_TDC1_BYTE_ADDR"])
        elif (tdc_idx == 2):
            self.uart_write_byte(ser, ADDR["GET_TDC2_BYTE_ADDR"])
        elif (tdc_idx == 3):
            self.uart_write_byte(ser, ADDR["GET_TDC3_BYTE_ADDR"])
        tdc_meas = ser.read ()
        tdc_meas = ord(tdc_meas)
        # print ("tdc %d measurement :  %d  %s "%(tdc_idx, tdc_meas, hex(tdc_meas)))
        return tdc_meas

    def enable_ro_heater (self, ser, num_heaters):
        self.uart_write_byte(ser, ADDR["SET_RO_HEATER_ON_ADDR"])
        def set_heater_enable_val (a):
            base = 0xFF
            res = ((base << a) & base) ^ base
            print ("The RO heater enable value is  ", "{:08b}".format(res))
            return res
        self.uart_write_byte(ser, set_heater_enable_val(num_heaters))
        time.sleep(10) # remember to uncomment

    def disable_ro_heater (self, ser):
        self.uart_write_byte(ser, ADDR["SET_RO_HEATER_OFF_ADDR"])
        time.sleep(10) # remember to uncomment sleep 300 originally

# def test(ser, measures, mesg):
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
    parser.add_argument('-b', '--baud', default="921600", type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default="/dev/ttyUSB6", type=str, required=False, help='Serial port device name.')
    parser.add_argument('-c', '--choice', type=int, required=False, help='Choice')
    parser.add_argument('-n', '--nummeasures', default=5, type=int, required=False, help='Num measures.')
    parser.add_argument('--mesg', default="", type=str, required=False, help='Message from user.')
    args = parser.parse_args()

    # configure the serial connections (the parameters differs on the device you are connecting to)
    ser = serial.Serial(
        port=args.port,
        baudrate=args.baud,
        parity=serial.PARITY_ODD,
        stopbits=serial.STOPBITS_TWO,
        bytesize=serial.EIGHTBITS
    )

    # Allow time for serial to intialize
    time.sleep (0.2)
    
    import atexit
    atexit.register(kill_proc)
    # vary_gpu()
    vary_cpu()

    # if (args.choice == 0):
    #     # experiment
    #     com = Communicator()
    #     com.test(ser, args.nummeasures, args.mesg)
    # elif (args.choice == 1):
    #     com = Communicator()
    #     # Turn on RO heater and wait for several min
    #     com.enable_ro_heater(ser, 8) # 4 heaters out of 8 
    # elif (args.choice == 2):
    #     com = Communicator()
    #     # Turn off RO heater and wait for several min
    #     com.disable_ro_heater(ser)
    # else:
    #     print ("Please make your choice!")


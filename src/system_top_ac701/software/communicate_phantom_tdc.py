from __future__ import print_function, division

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
from address_shanquan import *
from utilities_ilias import *
from phantom_ro_heater import *


TRANSMITTER_SERIAL      = '210203A7DC87A'   # kc705-01 serial no
# TRANSMITTER_SERIAL      = '210203A7D6C2A'   # kc705-02 serial no
# TRANSMITTER_SERIAL      = '210203A7DDF0A'   # ac701-01 serial no
# TRANSMITTER_SERIAL      = None              # Null

TRANSMITTER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
# TRANSMITTER_UART_PORT    = '/dev/ttyUSB3'    # kc705-02 uart port
# TRANSMITTER_UART_PORT    = '/dev/ttyUSB6'    # ac701-01 uart port
# TRANSMITTER_UART_PORT    = None

# RECEIVER_SERIAL       = '210203A7DC87A'   # kc705-01 serial no
RECEIVER_SERIAL       = '210203A7D6C2A'   # kc705-02 serial no
# RECEIVER_SERIAL       = '210203A7DDF0A'   # ac701-01 serial no

# RECEIVER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
RECEIVER_UART_PORT    = '/dev/ttyUSB3'    # kc705-02 uart port
# RECEIVER_UART_PORT    = '/dev/ttyUSB6'    # ac701-01 uart port

FPGA_TRANS = 'ac701'
# FPGA_TRANS = 'kc705'
# FPGA_TRANS = None

FPGA_RECV = 'kc705'
# FPGA_RECV = 'ac701'

PART_TRANS = 'xc7a200tfbg676' # ac701 part no
# PART_TRANS = 'xc7k325tffg900' # kc705 part no

roCounts          = [[],[],[],[]]
tx_bits_ref       = []
error_rate        = []
roCounts_heater_0 = []
roCounts_heater_1 = []
roCounts_heater_2 = []
roCounts_heater_3 = []
plot_path ='/home/aee38/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/plots/'

def get_upload_tcl_dir():
    script = os.path.dirname(os.path.abspath(__file__))
    upload_tcl_dir = os.path.dirname(script) + '/Vivado/'
    return upload_tcl_dir

def get_build_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    build_dir = os.path.dirname(script) + '/build/'
    return build_dir

def get_receiver_script_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    receiver = os.path.dirname(script) 
    src = os.path.dirname(receiver) + '/code_4TDCs_receiver/build/'
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

# def stress_cpus(ncpus):
#     if ncpus == -1:
#         print("Stressing with GPU")
#         cmd = ['./gpu_burn', '1200'] # enable for as long as needed
#         cwd = '/home/anthony/Documents/fpga-phantom-circuits/src/gpu_burn/gpu-burn-ace04173bf19d72178949b26a9874e2606cc354f'
#         # cwd = '/home/anthony/Documents/fpga-phantom-circuits/src/gpu_burn/gpu-burn-35cfc4045d8435ffac20035bab31e8c412aa1cb4'
#     else:
#         print("Stressing with %d CPUs" % ncpus)
#         if ncpus <= 0:
#             return None
#         cwd = None
#         cmd = [
#             'stress',
#             '--cpu',
#             '%d' % ncpus
#         ]
#     proc = subprocess.Popen(cmd, cwd=cwd, stdout=sys.stderr) # subprocess.DEVNULL
#     return proc

def kill_proc(proc=None):
    subprocess.call(['pkill', '-TERM', 'stress'])
    subprocess.call(['pkill', '-TERM', 'gpu_burn'])
    if proc:
        subprocess.call(['pkill', '-TERM', '-P', str(proc.pid)])

# def vary_cpu():
#     print("Varying CPU load")
#     com = Communicator()
#     com.upload()

#     nthreads = multiprocessing.cpu_count()
#     for ncpus in range(nthreads, nthreads-1, -1): # test no CPUs as base case
#     # for ncpus in range(nthreads, 0, -1): # test no CPUs as base case
#         parameters = {
#             'measurements': 1200,
#             'mask': 1,
#             # 'repetitions': 4,
#             'trig_bit': 18,
#             'cpu_cores': ncpus,
#             'sleep_time': 5,
#             'heater_no': 8,
#             'outdir': 'measurements/cpu/{}/'.format(ncpus),
#         }
#         com.measure(parameters)
#         break

# def vary_gpu():
#     print("Varying GPU load")
#     com = Communicator()
#     com.upload()

#     for ngpus in range(1, 2): # don't test empty
#         parameters = {
#             'measurements': 1500,
#             # 'mask': 1,
#             # 'repetitions': 4,
#             'trig_bit': 21,
#             'sleep': 3,
#             'cpu_cores': -ngpus, # hack
#             'sleep_time': 5,
#             'heater_no': 8,
#             'outdir': 'measurements/gpu/{}/'.format(ngpus),
#         }
#         com.measure(parameters)

def vary_fpga():
    print("Varying FPGA load")
    com = Communicator() # FIXME: set the right ports and serial numbers
    com.upload()
    parameters = {
        'measurements': 1500,
        # 'mask': 0x1f,
        # 'repetitions': 4,
        # 'trig_bit': 21,
        # can also change transmitter_mask
        # 'transmitter_mask': 0xffff,
        # 'trans_trig_bit': 21,
        'sleep_time': 5,
        'heater_no': 8,
        'outdir': 'phantom_tdc_measurements/fpga/{}/'.format(1),
        # 'delay_cycles':12582912,
        # 'cooldown_cycles':8388608,
        # 'num_tx_bits': 32,
        # # 'tx': None,
        # # 'tx': '0x' + secrets.token_hex(8)[8:], # random 32 bit number
        # 'ro_sensor_cycles': 2**15,
        # 'ro_sensor_cycles_offset': 2**15,
        # 'ro_heater_on_num': 5,        
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
        vivado = "/tools/Xilinx/Vivado/2019.1/bin/vivado"

        cmd = [vivado, '-mode', 'batch', '-source', uploadfile,
               '-nojournal', '-nolog', '-tclargs', bitfile, serial]
        ret = subprocess.call(cmd)
        if ret != 0:
            raise Exception("System call returned %d. Aborting." % ret)
    
    def upload(self):
        self.upload_one(get_receiver_script_dir() + FPGA_RECV + '/synth_system.bit', self.recv_serial_no)

        if self.trans_serial:
            self.upload_one(get_build_dir() + FPGA_TRANS + '/synth_system.bit', self.trans_serial_no)
    
    def read(self, num_bytes=None):
        val = 0
        if not num_bytes:
            num_bytes = Communicator.CNT_WIDTH//8
        for b in range(num_bytes):
            val_in = ord(self.recv_serial.read())
            val = (val << 8) | val_in
        return val

    def write_to_transmitter(self, delay_cycles, cooldown_cycles, num_tx_bits, roCounts, tx, tx_bits_ref, plot_path,ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num):
        if not self.trans_serial:
            print("WARNING: trying to write to transmitter which is not set")
            return
        
        phantom_heater_measure(usb_port=TRANSMITTER_UART_PORT, baud=921600, delay_cycles= delay_cycles, tx_delayTime= int((2**24)*10), cooldown_cycles= cooldown_cycles, num_tx_bits= num_tx_bits, roCounts=roCounts, tx=tx,tx_bits_ref=tx_bits_ref,plot_path=plot_path,ro_sensor_cycles=ro_sensor_cycles, ro_sensor_cycles_offset=ro_sensor_cycles_offset, ro_heater_on_num=ro_heater_on_num)
        
        # to_write = list_to_bytes([(bit, 2)], big_endian)
        # self.trans_serial.write(to_write)
        # print("trig bit type is ",type(trig_bit))
        # if trig_bit is not None:
        #     shift = 1 << 5
        #     # print("shift type is ",type(shift))
        #     value = shift | (trig_bit & (shift - 1))
        # else:
        #     value = 0
        # self.trans_serial.write(list_to_bytes([(value, 1)], big_endian))

    def write_to_receiver(self, ser, bit, sleep_time, heater_no):
        # self.disable_ro_heater(ser)
        if bit:
            self.enable_ro_heater(ser, heater_no)  # 8 heaters out of 8  enabled
            time.sleep(sleep_time)
        else:
            self.disable_ro_heater(ser)
            
    def measure(self, override_parameters):
        tx_bit_str = '0x' + secrets.token_hex(8)[8:]
        tx_bit = int(tx_bit_str, 16)  
        parameters = {
            'trig_bit': 21,
            'measurements': 500,
            'repetitions': 1,
            # 'mask': 0xff,
            # 'pattern': int_to_manchester(0xab, 8), #int_to_manchester(0xf3ed1, 20),
            'pattern': int_to_manchester_anthony(tx_bit, 32), #int_to_manchester(0xf3ed1, 20),
            'outdir': None,
            # 'cpu_cores': None,
            'sleep': 3,
            # 'transmitter_mask': 0xffff,
            # 'trans_trig_bit': None,
            'sleep_time': 10,
            'heater_no': 8,
            'delay_cycles':12582912,
            'cooldown_cycles':8388608,
            'num_tx_bits': 32,
            'tx': tx_bit_str,
            'ro_sensor_cycles': 2**15,
            'ro_sensor_cycles_offset': 2**15,
            'ro_heater_on_num': 5, 
        }
        for k in override_parameters.keys():
            if k not in parameters:
                raise ValueError("%s not in receiver parameters" % k)
            parameters[k] = override_parameters[k]
        
        if 'sleep' not in parameters:
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
        repetitions = params.get('repetitions', 1)
        sleep_time = params['sleep_time']
        heater_no = params['heater_no']
        sleep = params.get('sleep', 0)
        # is_cpu = params.get('cpu_cores', None) is not None
        delay_cycles = params['delay_cycles']
        cooldown_cycles = params['cooldown_cycles']
        num_tx_bits = params['num_tx_bits']
        tx = params['tx']
        ro_sensor_cycles= params['ro_sensor_cycles']
        ro_sensor_cycles_offset = params['ro_sensor_cycles_offset']
        ro_heater_on_num = params['ro_heater_on_num']
        # if is_cpu:
        #     transmit_mask = params['cpu_cores']
        # else:
        #     transmit_mask = params['transmitter_mask']
        #     trans_trig_bit = params.get('trans_trig_bit', None)
        
        # pat_len = len(pattern)
        # for i, bit in enumerate(pattern):
        print("Transmitting %s as the transmitted bit and sleeping for %d" % (tx, sleep))
        self.write_to_transmitter(delay_cycles, cooldown_cycles, num_tx_bits, roCounts, tx, tx_bits_ref, plot_path,ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num)
        time.sleep(sleep)      
        
        # print("Transmitting %d as the %d/%d bit and sleeping for %d" % (bit, i+1, pat_len, sleep))
        # proc = None
        # if is_cpu:
        #     if bit:
        #         proc = stress_cpus(transmit_mask)
        # else:
        #     self.write_to_transmitter(transmit_mask if bit else 0, trans_trig_bit)

        print("Writing to receiver now")
        # for i in range(2*num_tx_bits): # can also use this as well
        for i, bit in enumerate(pattern):
            self.write_to_receiver(self.recv_serial, bit,sleep_time,heater_no)
            measurements = self.read_from_receiver(self.recv_serial, num_measurements,'test')
            measurements =  np.mean(measurements[:,:-2], axis=1)
            measurements = measurements.tolist()
            print(measurements)
            # print ("Average : ", measurements)
            extra_data = {
                # 'transmitter_mask': transmit_mask,
                'transmitter_bit': bit,
            }
            if outdir:
                outfile = '%s/%d_%d.csv' % (outdir, i, 0)
            else:
                outfile = None
            if outfile and os.path.exists(outfile):
                if not params.get('overwrite', True):
                    print("File %s exists. not overwriting." % outfile)
                    outfile = None
            DataParser.write_tdc_measurements(measurements, repetitions, outfile, extra_data)
            
        #     if is_cpu:
        #         kill_proc(proc)
        #         time.sleep(sleep)
        # if not is_cpu:
        #     # to prevent damage
        #     self.write_to_transmitter(0, trans_trig_bit)
            
    ########################################
    ## TDC INITIALIZATION
    ########################################
    def read_from_receiver(self, ser, measures, mesg):
        # Set up TDC
        self.set_up_tdc(ser, measures)
        self.reset_tdc(ser)
        self.start_tdc(ser)
        # 4 TDCs, measures+2 records
        data = np.zeros((4, measures+2))
        for i in range(4):
            for j in range(measures+2):
                data[i][j] = self.read_tdc(ser, i)
        # out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(self.getTimeStamp(), measures, mesg)
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

    def set_up_tdc (self, ser, measures, config = 0xff, coarse = 0x1F, fine = 0x1F, nTDCs = 4):  # 0x1A for kc705-01 and 0x1F for kc705-02, 0x5 0x2, 0x9 0x2, 0xb 0x2, 0xc 0x2 for ac701
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
        time.sleep(5) # remember to uncomment

    def disable_ro_heater (self, ser):
        self.uart_write_byte(ser, ADDR["SET_RO_HEATER_OFF_ADDR"])
        time.sleep(5) # remember to uncomment sleep 300 originally

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
    
    # vary fpga experiment
    vary_fpga()
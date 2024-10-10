from __future__ import print_function, division

import argparse
import json
import multiprocessing
import os
import serial
import signal
import socket
import subprocess
import sys
import time
import sensors
from utilities_ilias import *
from phantom_ro_heater import *

# TRANSMITTER_SERIAL      = '210203A7DC87A'   # kc705-01 serial no
# TRANSMITTER_SERIAL      = '210203A7D6C2A'   # kc705-02 serial no
TRANSMITTER_SERIAL      = '210203A7DDF0A'   # ac701-01 serial no
# TRANSMITTER_SERIAL      = None              # Null

# TRANSMITTER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
# TRANSMITTER_UART_PORT    = '/dev/ttyUSB2'    # kc705-02 uart port
TRANSMITTER_UART_PORT    = '/dev/ttyUSB3'    # ac701-01 uart port
# TRANSMITTER_UART_PORT    = None

# RECEIVER_SERIAL       = '210203A7DC87A'   # kc705-01 serial no
RECEIVER_SERIAL       = '210203A7D6C2A'   # kc705-02 serial no
# RECEIVER_SERIAL       = '210203A7DDF0A'   # ac701-01 serial no

# RECEIVER_UART_PORT    = '/dev/ttyUSB0'    # kc705-01 uart port
RECEIVER_UART_PORT    = '/dev/ttyUSB0'    # kc705-02 uart port
# RECEIVER_UART_PORT    = '/dev/ttyUSB5'    # ac701-01 uart port

PART_RECV = 'xc7k325tffg900' # kc705 part no
# PART_RECV = 'xc7a200tfbg676' # ac701 part no

FPGA_TRANS = 'ac701'
# FPGA_TRANS = 'kc705'
# FPGA_TRANS = None

roCounts          = [[],[],[],[]]
tx_bits_ref       = []
error_rate        = []
tx_bits_pred      = []
roCounts_heater_0 = []
roCounts_heater_1 = []
roCounts_heater_2 = []
roCounts_heater_3 = []
plot_path ='/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/plots/'

def get_upload_tcl_dir():
    script = os.path.dirname(os.path.abspath(__file__))
    upload_tcl_dir = os.path.dirname(script) + '/Vivado/'
    return upload_tcl_dir

def get_transmitter_build_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    build_dir = os.path.dirname(script) + '/build/'
    return build_dir

def get_receiver_script_dir():
    script = os.path.dirname(os.path.abspath(__file__)) 
    receiver = os.path.dirname(script) 
    src = os.path.dirname(receiver) + '/covert_ro_receiver/scripts/'
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
        # cmd = ['./gpu_burn', '1200'] # enable for as long as needed
        cmd = ['./gpu_burn', '5400'] # enable for as long as needed
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
    com.upload()

    nthreads = multiprocessing.cpu_count()
    for ncpus in range(nthreads, nthreads-1, -1): # test no CPUs as base case
    # for ncpus in range(nthreads, -1, -2): # test no CPUs as base case
    # for ncpus in range(10, 10-1, -2): # test no CPUs as base case
        parameters = {
            'measurements': 500, # 500 for kc705-01 and kc705-02, 500 for ac701
            'mask': 1,
            # 'mask': 0x1f,
            # 'repetitions': 4,
            'trig_bit': 18,  # 21, 18 for kc705-01 and kc705-02, 15 for ac701
            'cpu_cores': ncpus,
            'outdir': 'measurements/cpu/{}/'.format(ncpus),
        }
        com.measure(parameters)

def vary_gpu():
    print("Varying GPU load")
    com = Communicator()
    com.upload()

    for ngpus in range(1, 2): # don't test empty
        parameters = {
            'measurements': 1500,
            'mask': 1,
            # 'repetitions': 4,
            'trig_bit': 21,
            'sleep': 3,
            'cpu_cores': -ngpus, # hack
            'outdir': 'measurements/gpu/{}/'.format(ngpus),
        }
        com.measure(parameters)

def vary_fpga():
    print("Varying FPGA load")
    com = Communicator() # FIXME: set the right ports and serial numbers
    com.upload()
    # num_tx_bits = 256
    num_tx_bits = 2
    # num_tx_bits = 16
    trig_bit = 21
    parameters = {
        'measurements': 500,
        'mask': 0x1f,
        # 'repetitions': 4,
        'trig_bit': trig_bit,
        # can also change transmitter_mask
        # 'transmitter_mask': 0xffff,
        # 'trans_trig_bit': 21,
        'outdir': 'phantom_ro_measurements/fpga/{}/'.format(num_tx_bits),
        'delay_cycles':2097152,
        'cooldown_cycles':2097152,
        'num_tx_bits': num_tx_bits,
        'ro_sensor_cycles': 2**21,
        'ro_sensor_cycles_offset': 500,
        'ro_heater_on_num': 5,      
        # 'cpu_running': True,
        # 'gpu_running': True,  
    }
    com.measure(parameters)


class Communicator(object):
    CNT_WIDTH = 32

    def __init__(self, recv_port=RECEIVER_UART_PORT , recv_serial_no=RECEIVER_SERIAL, trans_port=TRANSMITTER_UART_PORT, trans_serial_no=TRANSMITTER_SERIAL, trans_baudrate=921600, recv_baudrate=115200, parity=serial.PARITY_ODD):
        self.recv_serial = serial.Serial(port=recv_port, baudrate=recv_baudrate, parity=parity)
        self.recv_serial.reset_input_buffer()
        self.recv_serial.reset_output_buffer()

        self.recv_serial_no = recv_serial_no
        self.trans_serial_no = trans_serial_no

        if trans_port is not None:
            self.trans_serial = serial.Serial(port=trans_port, baudrate=trans_baudrate, parity=parity)
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
        self.upload_one(get_receiver_script_dir() + 'binaries/' + PART_RECV + '/covert_receiver_top.bit', self.recv_serial_no)

        if self.trans_serial:
            self.upload_one(get_transmitter_build_dir() + FPGA_TRANS + '/synth_system.bit', self.trans_serial_no)

    def read(self, num_bytes=None):
        val = 0
        if not num_bytes:
            num_bytes = Communicator.CNT_WIDTH//8
        for b in range(num_bytes):
            val_in = ord(self.recv_serial.read())
            val = (val << 8) | val_in
        return val

    def write_to_transmitter_crosstalk(self, delay_cycles, cooldown_cycles, num_tx_bits, roCounts, tx, tx_bits_ref, tx_bits_pred):
        if not self.trans_serial:
            print("WARNING: trying to write to transmitter which is not set")
            return
        
        pred, error = phantom_heater_measure(usb_port=TRANSMITTER_UART_PORT, baud=921600, delay_cycles= delay_cycles, tx_delayTime= int((2**24)*10), cooldown_cycles= cooldown_cycles, num_tx_bits= num_tx_bits, roCounts=roCounts, tx=tx,tx_bits_ref=tx_bits_ref, tx_bits_pred=tx_bits_pred)
        return pred, error
    
    def write_to_transmitter_heater(self, plot_path, ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num):
        ro_heater(usb_port=TRANSMITTER_UART_PORT, baud=921600, plot_path=plot_path, ro_sensor_cycles=ro_sensor_cycles, ro_sensor_cycles_offset=ro_sensor_cycles_offset, ro_heater_on_num=ro_heater_on_num)

    def write_to_receiver(self, params, big_endian=True):
        send_stages = params.get('has_stages', False) & 1
        params['wait_cnt'] |= (send_stages << 7)
        list_vals = [
            (params['trig_bit'], 1),
            (params['wait_cnt'], 1),
            (params['measurements'], 2),
            (params['mask'], 1),
        ]
        to_write = list_to_bytes(list_vals, big_endian)
        self.recv_serial.write(to_write)

        print("Wrote", list_vals)
        raw_config = self.read(4 if send_stages else 3)
        config = self.parse_config(raw_config, send_stages)
        config['num_measurements'] = params['measurements']
        config['mask'] = params['mask']
        print("Received configuration 0x%08x:" % raw_config, "interpreted as", config)
        return config

    def measure(self, override_parameters):
        # tx_bit_str = '0x' + secrets.token_hex(64)[64:]
        # tx_bit_str = '0x' + secrets.token_hex(8)[8:]
        # tx_bit_str = '0x' + secrets.token_hex(4)[4:]
        tx_bit_str = '0x3'
        tx_bit = int(tx_bit_str, 16) 
        parameters = {
            'wait_cnt': 5,
            'trig_bit': 21,
            'measurements': 500,
            'mask': 0xff,
            'repetitions': 1,
            # 'pattern_orig': int_to_manchester(tx_bit, 32), #int_to_manchester(0xf3ed1, 20),
            # 'pattern_orig': int_to_manchester(tx_bit, 256), #int_to_manchester(0xf3ed1, 20),
            # 'pattern_orig': int_to_manchester(tx_bit, 16), #int_to_manchester(0xf3ed1, 20),
            'pattern_orig': int_to_manchester(0x3, 2), #int_to_manchester(0xf3ed1, 20),
            'outdir': None,
            # 'cpu_cores': None,
            'has_stages': False,
            'sleep': 3,
            # 'transmitter_mask': 0xffff,
            # 'trans_trig_bit': None,
            'delay_cycles':4194304,
            'cooldown_cycles':4194304,
            'num_tx_bits': 32,
            'tx': tx_bit_str,
            'ro_sensor_cycles': 2**21,
            'ro_sensor_cycles_offset': 500,
            'ro_heater_on_num': 5, 
            'cpu_running': None,
            'gpu_running': None,
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

    def read_from_receiver(self, config):
        parser = DataParser(self, config)
        measurements = parser.measure()
        return measurements

    def communicate_pattern(self, params):
        print("Communicating with", params)
        outdir = params.get('outdir', None)
        pattern_orig = params['pattern_orig']
        repetitions = params.get('repetitions', 1)
        sleep = params.get('sleep', 0)
        delay_cycles = params['delay_cycles']
        cooldown_cycles = params['cooldown_cycles']
        num_tx_bits = params['num_tx_bits']
        tx = params['tx']
        ro_sensor_cycles= params['ro_sensor_cycles']
        ro_sensor_cycles_offset = params['ro_sensor_cycles_offset']
        ro_heater_on_num = params['ro_heater_on_num']     
        cpu_running = params.get('cpu_running', None) is not None
        gpu_running = params.get('gpu_running', None) is not None
        lm_sensor_script = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/software/lm_sensors_3.py'
        sensor_cmd = ['python3', lm_sensor_script]
        
        print("\nPerforming Crosstalk and getting predicted bits")
        pattern_pred, error = self.write_to_transmitter_crosstalk(delay_cycles, cooldown_cycles, num_tx_bits, roCounts, tx, tx_bits_ref, tx_bits_pred)
        pattern_pred = int(pattern_pred, 2) 
        pattern_pred = int_to_manchester(pattern_pred, num_tx_bits)
        print("The error rate is  %f percent "%(error))
        print("")
        # return
        
        # appending  pred bits to json file
        json_file = open(outdir + 'parameters.json')
        json_data = json.load(json_file)
        entry = {'pattern_pred': pattern_pred}
        json_data.update(entry)        
        with open(outdir + 'parameters.json', 'w') as outfile:
            json.dump(json_data, outfile, indent=4)
        time.sleep(sleep) 

        # if gpu_running:
        #     # if bit:
        #     gpu_transmit_mask = -1
        #     proc_0 = stress_cpus(gpu_transmit_mask)

        sensor_proc = subprocess.Popen(sensor_cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
        
        for i, bit in enumerate(pattern_pred):  
            print("Transmitting %d as the %d/%d bit and turning on Transmitter heaters now "%(bit, i+1, len(pattern_pred)))       
            proc = None
            if gpu_running:
                if bit:
                    gpu_transmit_mask = -1
                    proc = stress_cpus(gpu_transmit_mask)
                             
            self.write_to_transmitter_heater(plot_path, ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num)
            
            if cpu_running:
                # if bit:
                cpu_transmit_mask = multiprocessing.cpu_count()
                proc = stress_cpus(cpu_transmit_mask)
                time.sleep(sleep)

            # if gpu_running:
            #     # if bit:
            #     gpu_transmit_mask = -1
            #     proc = stress_cpus(gpu_transmit_mask)
            #     time.sleep(sleep)
            
            

            print("Writing to receiver now")
            config = self.write_to_receiver(params)
            measurements = self.read_from_receiver(config)
            mask = params['mask'] & ((1 << config['num_heats']) - 1)
            extra_data = {
                'transmitter_bit_orig': pattern_orig[i],
                'transmitter_bit_pred': bit
            }
            if outdir:
                outfile = '%s/%d_%d.csv' % (outdir, i, 0)
            else:
                outfile = None
            if outfile and os.path.exists(outfile):
                if not params.get('overwrite', True):
                    print("File %s exists. not overwriting." % outfile)
                    outfile = None
            DataParser.write_measurements(measurements, mask, outfile, extra_data)

            if cpu_running:
                kill_proc(proc)
                time.sleep(sleep)

            if gpu_running:
                kill_proc(proc)
                time.sleep(sleep)

        subprocess.call(['kill', '-9', str(sensor_proc.pid)])
            
        # if gpu_running:
        #         kill_proc(proc_0)
        #         time.sleep(sleep)
                    
        self.write_to_transmitter_heater(plot_path, ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num)
       
        # for j in range(repetitions):
        #     print("Repetition %d/%d for %d/%d bit = %d" % (j+1, repetitions, i+1, pat_len, bit))

    @staticmethod
    def parse_config(val, send_stages=False):
        config = {}
        if send_stages:
            config['ctrl_stages'] = val & 0xF
            val >>= 4
            config['heat_stages'] = val & 0xF
            val >>= 4
        else:
            config['ctrl_stages'] = 0
            config['heat_stages'] = 0
        config['num_ctrls'] = val & 0xF
        val >>= 4
        config['num_heats'] = val & 0xF
        val >>= 4
        config['num_heat_ros'] = val & 0xFF
        val >>= 8
        config['num_ctrl_ros'] = val & 0xFF
        val >>= 8

        return config

if __name__ == "__main__":
    # Get command line arguments

    import atexit
    atexit.register(kill_proc)
    
    # vary fpga experiment
    vary_fpga()
    
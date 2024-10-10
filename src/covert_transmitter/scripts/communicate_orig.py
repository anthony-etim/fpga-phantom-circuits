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

from utilities import *

def get_script_dir():
    return os.path.dirname(os.path.abspath(__file__)) + '/'

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
        cmd = ['gpu_burn', '1200'] # enable for as long as needed
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
        parameters = {
            'measurements': 1500,
            'mask': 1,
            'trig_bit': 18,
            'cpu_cores': ncpus,
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
            'measurements': 500,
            # 'mask': 1,
            # 'repetitions': 4,
            'trig_bit': 15,
            'sleep': 3,
            'cpu_cores': -ngpus, # hack
            'outdir': 'measurements/gpu/{}/'.format(ngpus),
        }
        com.measure(parameters)

def vary_fpga():
    print("Varying FPGA load")
    com = Communicator() # FIXME: set the right ports and serial numbers
    com.upload()
    parameters = {
        'measurements': 500,
        'mask': 0x1f,
        'trig_bit': 21,

        # can also change transmitter_mask
        'outdir': 'measurements/fpga/',
    }
    com.measure(parameters)


class Communicator(object):
    CNT_WIDTH = 32

    def __init__(self, recv_port='/dev/ttyUSB1', recv_serial_no='', trans_port=None, trans_serial_no='', baudrate=115200, parity=serial.PARITY_ODD):
        self.recv_serial = serial.Serial(port=recv_port, baudrate=baudrate, parity=parity)
        self.recv_serial.reset_input_buffer()
        self.recv_serial.reset_output_buffer()

        self.recv_serial_no = recv_serial_no
        self.trans_serial_no = trans_serial_no

        if trans_port is not None:
            self.trans_serial = serial.Serial(port=trans_port, baudrate=baudrate, parity=parity)
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
        uploadfile = get_script_dir() + 'upload.tcl'
        vivado = "/tools/Xilinx/Vivado/2019.2/bin/vivado"

        cmd = [vivado, '-mode', 'batch', '-source', uploadfile,
               '-nojournal', '-nolog', '-tclargs', bitfile, serial]
        ret = subprocess.call(cmd)
        if ret != 0:
            raise Exception("System call returned %d. Aborting." % ret)

    def upload(self):
        self.upload_one(get_script_dir() + 'binaries/covert_receiver_top.bit', self.recv_serial_no)

        if self.trans_serial:
            self.upload_one(get_script_dir() + 'binaries/covert_transmitter_top.bit', self.trans_serial_no)

    def read(self, num_bytes=None):
        val = 0
        if not num_bytes:
            num_bytes = Communicator.CNT_WIDTH//8
        for b in range(num_bytes):
            val_in = ord(self.recv_serial.read())
            val = (val << 8) | val_in
        return val

    def write_to_transmitter(self, bit, trig_bit, big_endian=True):
        if not self.trans_serial:
            print("WARNING: trying to write to transmitter which is not set")
            return
        to_write = list_to_bytes([(bit, 2)], big_endian)
        self.trans_serial.write(to_write)
        if trig_bit is not None:
            shift = 1 << 5
            value = shift | (trig_bit & (shift - 1))
        else:
            value = 0
        self.trans_serial.write(list_to_bytes([(value, 1)], big_endian))

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
        parameters = {
            'wait_cnt': 5,
            'trig_bit': 21,
            'measurements': 500,
            'mask': 0xff,
            'repetitions': 4,
            'pattern': int_to_manchester(0xab, 8), #int_to_manchester(0xf3ed1, 20),

            'outdir': None,
            'cpu_cores': None,
            'has_stages': False,

            'transmitter_mask': 0xffff,
            'trans_trig_bit': None,
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

    def read_from_receiver(self, config):
        parser = DataParser(self, config)
        measurements = parser.measure()
        return measurements

    def communicate_pattern(self, params):
        print("Communicating with", params)
        outdir = params.get('outdir', None)
        pattern = params['pattern']
        repetitions = params.get('repetitions', 1)
        sleep = params.get('sleep', 0)
        is_cpu = params.get('cpu_cores', None) is not None
        if is_cpu:
            transmit_mask = params['cpu_cores']
        else:
            transmit_mask = params['transmitter_mask']
            trans_trig_bit = params.get('trans_trig_bit', None)

        pat_len = len(pattern)
        for i, bit in enumerate(pattern):
            print("Transmitting %d as the %d/%d bit and sleeping for %d" % (bit, i+1, pat_len, sleep))
            proc = None
            if is_cpu:
                if bit:
                    proc = stress_cpus(transmit_mask)
            else:
                self.write_to_transmitter(transmit_mask if bit else 0, trans_trig_bit)
                

            time.sleep(sleep)
            for j in range(repetitions):
                print("Repetition %d/%d for %d/%d bit = %d" % (j+1, repetitions, i+1, pat_len, bit))
                config = self.write_to_receiver(params)
                measurements = self.read_from_receiver(config)
                mask = params['mask'] & ((1 << config['num_heats']) - 1)
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
                DataParser.write_measurements(measurements, mask, outfile, extra_data)

            if is_cpu:
                kill_proc(proc)
                time.sleep(sleep)
        if not is_cpu:
            # to prevent damage
            self.write_to_transmitter(0, params)

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
    import atexit
    atexit.register(kill_proc)
    # vary_gpu()
    # vary_cpu()
    vary_fpga()

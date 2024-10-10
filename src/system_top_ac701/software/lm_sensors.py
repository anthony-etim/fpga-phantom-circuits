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
from six import iteritems
import itertools
import subprocess

out_str = []

def kill_proc(proc=None):
    subprocess.call(['pkill', '-TERM', 'sensors'])
    if proc:
        subprocess.call(['pkill', '-TERM', '-P', str(proc.pid)])
        
def lmsensors():
    cmd = ['sensors']
    cwd = None
    proc = subprocess.Popen(cmd, cwd=cwd, stdout=subprocess.PIPE) # subprocess.DEVNULL
    std_out, std_err = proc.communicate()
    std_out = std_out.decode("utf-8") 
    std_out.strip(), std_err    
    return proc, std_out

if __name__ == '__main__':
    import atexit
    atexit.register(kill_proc)

    plot_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/lm_sensors/'

    # with open(plot_path + "sensors.txt", "a") as f:
    for i in range(2):
        proc, out = lmsensors()
        out_str.append(out)

    # print(out_str)

    for i in range(len(out_str)):
        with open(plot_path + "sensors.txt", "a") as f:
            f.write(out_str[i])


        # print("te")
        # print(out)
        # 
        # print(out)

    
    # 
    #     proc = lmsensors()
        
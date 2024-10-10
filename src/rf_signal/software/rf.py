#!/usr/bin/python3.6

import time
import serial
# import os
import sys
import argparse
import numpy as np

from smc100a import SMC100A

def transaction (bus, measures, coarse, fine, nTDCs, heat=0):
    m = (measures).to_bytes (1, byteorder='big')
    c = (coarse).to_bytes (1, byteorder='big')
    f = (fine).to_bytes (1, byteorder='big')
    # h = (heat).to_bytes (1, byteorder='big')

    # print ( 'Sent:                       ' + str(measures) )
    bus.write (m)
    bus.write (c)
    bus.write (f)
    # bus.write (h)

    readings = []
    for _ in range(nTDCs):
        readings.append([])

    for i in range (measures * 4):
        b = bus.read ()
        # print (ord(b))
        col = i % nTDCs
        readings[col].append (ord (b))
    return readings

def printFormattedArray (arr):
    for i in range(len(arr[0])):
        row = ""
        for col in arr:
            row += "%30s" % col[i]
        print(row)

class normDistribution:
    def __init__ (self, data):
        self.data = data
        self.mean = 0.0
        self.stdev = 0.0
        self.compute ()
    
    def z (self, sample):
        stdev = self.stdev
        if stdev == 0.0:
            stdev = 1
        return (sample - self.mean) / stdev

    def compute (self):
        self.mean = np.mean (self.data)
        self.stdev = np.std (self.data)

    def __str__ (self):
        return 'Mean:%.4f, Std:%.4f' % (self.mean, self.stdev)

def initialize (bus, measures, coarse, fine, nTDCs, series = 10000):
    print ('Initializing...')
    data = []
    for i in range (nTDCs):
        # List for each TDC
        data.append ([])
        for _ in range (measures):
            # List for each measurement distribution
            data[i].append ([])
    
    print ('Beginning transactions...')
    for i in range (series):
        out = transaction (bus, measures, coarse, fine, nTDCs)
        for j in range (nTDCs):
            for k in range (measures):
                data[j][k].append (out[j][k])
    
    # Get distributions
    print ('Computing distributions....')
    norms = []
    for i in range (nTDCs):
        norms.append ([])
        for j in range (measures):
            norms[i].append (normDistribution(data[i][j]))
    
    return norms

def compareSample (norm, sample, measures, nTDCs):
    zScores = []
    for i in range (nTDCs):
        zScores.append ([])
        for j in range (measures):
            zScores[i].append (norm[i][j].z (sample[i][j]))

    zScoresFlat = []
    for i in range (nTDCs):
        zScoresFlat.append ([])
        zScoresFlat[i].append (np.sum (zScores[i]))

    return zScores, zScoresFlat

def pullAndProcessSample (bus, norms, measures, coarse, fine, nTDCs, heat=0):
    sample = transaction(bus, measures, coarse, fine, nTDCs, heat)
    z, zFlat = compareSample (norms, sample, measures, nTDCs)
    printFormattedArray (norms)
    print ('')
    printFormattedArray (sample)
    print ('')
    printFormattedArray (z)
    print ('')
    printFormattedArray (zFlat)
    print ('')
    return z, zFlat
    
if __name__ == '__main__':
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port latency tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default='/dev/ttyUSB1', type=str, required=False, help='Serial port device name.')
    parser.add_argument('-f', '--freq_mhz', default=500, type=int, required=False, help='Frequency to set.')
    parser.add_argument('--enable', action='store_true', help='Enable the RF generator.')
    parser.add_argument('--disable', action='store_true', help='Disable the RF generator.')
    args = parser.parse_args()

    freq = args.freq_mhz * 1e6

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

    # Open the siggen
    # Connect to the device
    siggen = SMC100A()
    siggen.reset()
    time.sleep(1)
    # Enable screen saver mode to save LCD display
    siggen.enable_screen_saver()
    time.sleep(1)
    # Set frequency to 100MHz (1e8) and enable output
    # Max voltage is 2800 mV ~ 1000 mV RMS
    siggen.set_carrier(freq, 2800)
    time.sleep(1)

    if (args.enable):
        siggen.enable(False, True)
    elif (args.disable):
        siggen.enable(False, False)




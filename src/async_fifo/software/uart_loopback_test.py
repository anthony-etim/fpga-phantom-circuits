#!/usr/bin/python3.6

import time
import serial
import os
import sys
import argparse
import json

def getUSBports (json_file):
    ports_json_file = open(json_file, 'r')
    ports_json_data = json.load(ports_json_file)
    ports_json_file.close()
    return ports_json_data

# Get command line arguments
parser = argparse.ArgumentParser(description='Serial port loopback design tester script.')
parser.add_argument('-b', '--baud', default=None, type=str, required=True, help='Baud rate of the serial port.')
# parser.add_argument('-p', '--port', default=None, type=str, required=True, help='Serial port device name.')
parser.add_argument('-j', '--json', default=None, type=str, required=True, help='Location of the JSON file.')
args = parser.parse_args()

# read USB port name
ports_json_data = getUSBports(args.json)
fpgas = list(ports_json_data.keys())
usb_port = ports_json_data[fpgas[0]]['uartport']

# baud = args.baud
# port = args.port

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
    port=usb_port,
    baudrate=args.baud,
    parity=serial.PARITY_ODD,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS
)

# Allow time for serial to intialize
time.sleep(0.2)

# Command encodings
get_mmcm_counts = b'\x01'
get_ro_counts   = b'\x02'
get_fifo_write  = b'\x03'
get_fifo_read   = b'\x04'

# Specify how many times to send random bytes to the FPGA,
# also keep track of number of correct replies
counter_max = 2
counter = 0
num_match = 0

readValues_ro    = []
readValues_mmcm  = []

# Send bytes to FPGA and read back the returned value
while( counter < counter_max ):

    
    # Generate random byte with value between 0 and 127
    while True:
        byte = os.urandom(1)
        if( byte <= (127).to_bytes(1, byteorder='big') ):
            break

    counter = counter + 1
    # ser.write(get_fifo_write)
    # time.sleep(0.2)
    # ser.write(byte)
    # print( '\nSent:      ' + str(ord(byte)) )
    
    
    # ser.write(get_fifo_read)
    # time.sleep(0.2)
    # c = ser.read()
    # print( 'Expecting: ' + str(int.from_bytes(byte, 'big') + 1) )
    # print( 'Got:       ' + str(ord(c)) )

    # if( ord(c) == (ord(byte) + 1 ) ):
    #     num_match = num_match + 1
    
    ## RO COUNTS
    #############################
    ser.write(get_ro_counts)
    time.sleep(0.1)
    debugValue_zero = 0
    for i in range(4):
        tmp = ser.read()
        # print (tmp)
        debugValue_zero = debugValue_zero + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
        time.sleep(0.1)
    print ("Read 32 bits for ro counts:", debugValue_zero)
    readValues_ro.append(debugValue_zero)
    # #############################

    ## MMCM COUNTS
    # #############################
    # ser.write(get_mmcm_counts)
    # time.sleep(0.1)
    # debugValue_one = 0
    # for i in range(4):
    #     tmp = ser.read()
    #     # print (tmp)
    #     debugValue_one = debugValue_one + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
    #     time.sleep(0.1)
    # print ("Read 32 bits for mmcm counts: ", debugValue_one)
    # readValues_mmcm.append(debugValue_one)
    #############################

if( num_match == counter_max ):
    print( 'Test passed.' )
    sys.exit(0)
else:
    print( 'Test failed.' )
    sys.exit(1)

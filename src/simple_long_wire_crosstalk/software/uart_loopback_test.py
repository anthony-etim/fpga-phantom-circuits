#!/usr/bin/python3.8

import time
import serial
import random
import sys
import argparse

# Get command line arguments
parser = argparse.ArgumentParser(description='Serial port loopback design tester script.')
parser.add_argument('-b', '--baud', default=None, type=str, required=True, help='Baud rate of the serial port.')
parser.add_argument('-p', '--port', default=None, type=str, required=True, help='Serial port device name.')
args = parser.parse_args()

baud = args.baud
port = args.port

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(
	port=port,
	baudrate=baud,
	parity=serial.PARITY_ODD,
	stopbits=serial.STOPBITS_TWO,
	bytesize=serial.EIGHTBITS
)

# Allow time for serial to intialize
time.sleep(0.2)

# Setup simple test: send random characters,
# and theck that the FPGA responds with the next character (ASCII value + 1)
letters = "ABCDEFGHIJKLMNOPQRSTUVWXY"
counter = 0
counter_max = 5
num_match = 0

while (counter < counter_max ):

    letter = random.choice( letters )
    counter = counter + 1

    print( 'Sent:      ' + letter )
    ser.write(letter.encode())

    print( 'Expecting: ' + str(chr(ord(letter) + 1 )))
    c = ser.read().decode()
    print( 'Got:       ' + c + '\n')

    if ( ord(letter) + 1 == ord(c) ):
        num_match = num_match + 1

if ( num_match == counter_max ):
    print('Test passed.')
    sys.exit(0)
else:
    print('Test failed.')
    sys.exit(1)

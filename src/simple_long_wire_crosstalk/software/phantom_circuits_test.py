#!/usr/bin/python3.8

import os
import time
import serial
import sys
import argparse






if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default=None, type=str, required=True, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default=None, type=str, required=True, help='Serial port device name.') 
    parser.add_argument('-d', '--data', default=None, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=True, help='Number of times to repeat.') 
    parser.add_argument('-c', '--cycles', default=10, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=10, type=int, required=False, help='Threshold value') 
    args = parser.parse_args()
    
    baud = args.baud
    port = args.port
    data = args.data
    data = [data]
    is_random = args.is_random_data
    repeat = args.repeat
    clock = args.cycles
    clock = [clock]
    threshold = args.threshold_value
    threshold = [threshold]

    if(data[0] == None and is_random == False):
        print("Error: Please specify input data or random data to be sent to the FPGA")
        sys.exit(0)

    if(data[0] != None and is_random == True):
        print("Error: Do not specify input data and random data at the same time")
        sys.exit(0)

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

    # Command encodings
    get_inital_data            = b'\x01'
    start_crosstalk            = b'\x02'
    is_phantom_receiver_ready  = b'\x03'
    get_final_data             = b'\x04'
    get_clocks_per_bit         = b'\x05'
    get_threshold              = b'\x06'
    counter = 0

    ser.write(get_clocks_per_bit)
    #ser.write(bytearray(clock))
    ser.write(clock)
    ser.write(get_threshold)
    ser.write(threshold)

    while (counter < repeat):
        if(is_random == True):
            initial_data = os.urandom(1)
        else:
            initial_data =  bytearray(data)

        ser.write(get_inital_data)
        #print('Data sent in bytes is ' + str(bin(int.from_bytes(initial_data, byteorder=sys.byteorder))))
        print('Data sent from console  is:   '+ '{:08b}'.format(int.from_bytes(initial_data , byteorder=sys.byteorder)))
        ser.write(initial_data)
        ser.write(start_crosstalk)
        ser.write(is_phantom_receiver_ready) 
        ser.read()
        ser.write(get_final_data)
        final_data = ser.read()
        int.from_bytes(final_data, byteorder=sys.byteorder)
        #binary_final_data = bin(int.from_bytes(final_data, byteorder=sys.byteorder)) 
        counter = counter + 1
        
        if(final_data == initial_data):
            print('Received data from FPGA is:   '+ '{:08b}'.format(int.from_bytes(final_data , byteorder=sys.byteorder)))
            print('Test passed.\n')
        else:
            print('Received data from FPGA is:   '+ '{:08b}'.format(int.from_bytes(final_data , byteorder=sys.byteorder)))
            print('Test failed.\n')

    sys.exit(0)
#!/usr/bin/python3.8
import os
import time
import serial
import sys
import argparse
import json
from matplotlib import pyplot as plt
import numpy as np

def getUSBports (json_file):
    ports_json_file = open(json_file, 'r')
    ports_json_data = json.load(ports_json_file)
    ports_json_file.close()
    return ports_json_data

if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-j', '--json', default=None, type=str, required=True, help='Location of the JSON file.')
    parser.add_argument('-d', '--data', default=0xFF, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    args = parser.parse_args()

    # read USB port name
    ports_json_data = getUSBports(args.json)
    fpgas = list(ports_json_data.keys())
    usb_port = ports_json_data[fpgas[0]]['uartport']

    cycles_per_bit = args.cycles.to_bytes(4,'big')
    cycles_per_bit = [[cycles_per_bit[0]],[cycles_per_bit[1]],[cycles_per_bit[2]],[cycles_per_bit[3]]]
    threshold = args.threshold_value.to_bytes(4,'big')
    threshold = [[threshold[0]],[threshold[1]],[threshold[2]],[threshold[3]]]

    if(args.data == None and args.is_random_data == False):
        print("Error: Please specify input data or random data to be sent to the FPGA")
        sys.exit(0)

    if(args.data != None and args.is_random_data == True):
        print("Error: Do not specify input data and random data at the same time")
        sys.exit(0)

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
    get_inital_data            = b'\x01'
    start_crosstalk            = b'\x02'
    is_phantom_receiver_ready  = b'\x03'
    get_final_data             = b'\x04'
    get_clocks_per_bit         = b'\x05'
    get_threshold              = b'\x06'
    # get_debug_rocounts         = b'\x07'
    get_debug_rocounts_zero    = b'\x07'
    get_debug_rocounts_one     = b'\x08'
    get_debug_rocounts_two     = b'\x09'
    get_debug_rocounts_three   = b'\x0A'
    get_debug_rocounts_four    = b'\x0B'
    get_debug_rocounts_five    = b'\x0C'
    get_debug_rocounts_six     = b'\x0D'
    get_debug_rocounts_seven   = b'\x0E'

    get_debug_rxWire = b'\x0F'

    counter = 0

    #########################
    ## Clocks_per_bit
    ser.write(get_clocks_per_bit)
    #ser.write(cycles_per_bit)
    ser.write(bytearray(cycles_per_bit[0]))
    #time.sleep(0.5)
    ser.write(bytearray(cycles_per_bit[1]))
    #time.sleep(0.5)
    ser.write(bytearray(cycles_per_bit[2]))
    #time.sleep(0.5)
    ser.write(bytearray(cycles_per_bit[3]))
    #########################

    #########################
    ## Threshold Value
    ser.write(get_threshold)
    #ser.write(threshold)
    ser.write(bytearray(threshold[0]))
    #time.sleep(0.5)
    ser.write(bytearray(threshold[1]))
    #time.sleep(0.5)
    ser.write(bytearray(threshold[2]))
    #time.sleep(0.5)
    ser.write(bytearray(threshold[3]))
    #########################

    
    readValues_zero  = []
    readValues_one   = []
    readValues_two   = []
    readValues_three = []
    readValues_four  = []
    readValues_five  = []
    readValues_six   = []
    readValues_seven = []

    if(args.is_random_data == True):
        initial_data = os.urandom(1)
    else:
        initial_data =  bytearray([args.data])
    print('Data sent from console  is:   '+ '{:08b}'.format(int.from_bytes(initial_data , byteorder=sys.byteorder)))

    while (counter < args.repeat):

        ser.write(get_inital_data)
        ser.write(initial_data)
        ser.write(start_crosstalk)
        time.sleep(0.5)
        ser.write(is_phantom_receiver_ready) 
        isReady = ser.read()
        # print ("read is_phantom_receiver_ready", isReady)

        ##############################
        # for test in range(8):
        #     ser.write(get_debug_rocounts) 
        #     debugValue = 0
        #     for i in range(4):
        #         tmp = ser.read()
        #         # print (tmp)
        #         debugValue = debugValue + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
        #         time.sleep(0.5)
        #     print ("Read 32 bits for bit " + str(test), debugValue)
        #     readValues.append(debugValue)
        # ##############################

        #############################
        ser.write(get_debug_rocounts_zero) 
        debugValue_zero = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_zero = debugValue_zero + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 0:", debugValue_zero)
        readValues_zero.append(debugValue_zero)
        #############################

        #############################
        ser.write(get_debug_rocounts_one) 
        debugValue_one = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_one = debugValue_one + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 1:", debugValue_one)
        readValues_one.append(debugValue_one)
        #############################

        #############################
        ser.write(get_debug_rocounts_two) 
        debugValue_two = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_two = debugValue_two + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 2:", debugValue_two)
        readValues_two.append(debugValue_two)
        #############################

        #############################
        ser.write(get_debug_rocounts_three) 
        debugValue_three = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_three = debugValue_three + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 3:", debugValue_three)
        readValues_three.append(debugValue_three)
        #############################

        #############################
        ser.write(get_debug_rocounts_four) 
        debugValue_four = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_four = debugValue_four + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 4:", debugValue_four)
        readValues_four.append(debugValue_four)
        #############################

        #############################
        ser.write(get_debug_rocounts_five) 
        debugValue_five = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_five = debugValue_five + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 5:", debugValue_five)
        readValues_five.append(debugValue_five)
        #############################

        #############################
        ser.write(get_debug_rocounts_six) 
        debugValue_six = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_six = debugValue_six + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 6:", debugValue_six)
        readValues_six.append(debugValue_six)
        #############################

        #############################
        ser.write(get_debug_rocounts_seven) 
        debugValue_seven = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_seven = debugValue_seven + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 7:", debugValue_seven)
        readValues_seven.append(debugValue_seven)
        #############################

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

    print ("RO counts for bit 0", str(readValues_zero))
    print ("The average RO counts for bit 0 = %.3f"%(sum(readValues_zero)/len(readValues_zero)) )
    print ("Min %d \t Max %d \n"%(min(readValues_zero), max(readValues_zero)))

    print ("RO counts for bit 1", str(readValues_one))
    print ("The average RO counts for bit 1 = %.3f"%(sum(readValues_one)/len(readValues_one)) )
    print ("Min %d \t Max %d \n"%(min(readValues_one), max(readValues_one)))

    print ("RO counts for bit 2", str(readValues_two))
    print ("The average RO counts for bit 2 = %.3f"%(sum(readValues_two)/len(readValues_two)) )
    print ("Min %d \t Max %d \n"%(min(readValues_two), max(readValues_two)))

    print ("RO counts for bit 3", str(readValues_three))
    print ("The average RO counts for bit 3 = %.3f"%(sum(readValues_three)/len(readValues_three)) )
    print ("Min %d \t Max %d \n"%(min(readValues_three), max(readValues_three)))

    print ("RO counts for bit 4", str(readValues_four))
    print ("The average RO counts for bit 4 = %.3f"%(sum(readValues_four)/len(readValues_four)) )
    print ("Min %d \t Max %d \n"%(min(readValues_four), max(readValues_four)))

    print ("RO counts for bit 5", str(readValues_five))
    print ("The average RO counts for bit 5 = %.3f"%(sum(readValues_five)/len(readValues_five)) )
    print ("Min %d \t Max %d \n"%(min(readValues_five), max(readValues_five)))

    print ("RO counts for bit 6", str(readValues_six))
    print ("The average RO counts for bit 6 = %.3f"%(sum(readValues_six)/len(readValues_six)) )
    print ("Min %d \t Max %d \n"%(min(readValues_six), max(readValues_six)))

    print ("RO counts for bit 7", str(readValues_seven))
    print ("The average RO counts for bit 7 = %.3f"%(sum(readValues_seven)/len(readValues_seven)) )
    print ("Min %d \t Max %d \n"%(min(readValues_seven), max(readValues_seven)))

    time.sleep(0.5)
    ser.write(get_debug_rxWire) 
    rxWire = ser.read()
    print ("read rxWire", rxWire)

    frequency_zero  = np.array(readValues_zero)/args.cycles *200
    frequency_one   = np.array(readValues_one)/args.cycles *200
    frequency_two   = np.array(readValues_two)/args.cycles *200
    frequency_three = np.array(readValues_three)/args.cycles *200
    frequency_four  = np.array(readValues_four)/args.cycles *200
    frequency_five  = np.array(readValues_five)/args.cycles *200
    frequency_six   = np.array(readValues_six)/args.cycles *200
    frequency_seven = np.array(readValues_seven)/args.cycles *200

    frequency = np.concatenate((frequency_zero,frequency_one,frequency_two,frequency_three,frequency_four, frequency_five,frequency_six,frequency_seven))
    print(frequency)
    print(frequency)
    plt.hist(frequency, bins='auto')
    plt.show()


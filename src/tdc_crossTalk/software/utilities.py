import os
import time
import serial
import sys
import argparse
import json

from addr import *

from os.path import expanduser
HOME = expanduser("~")

def HM(n):
    c = 0
    while n:
        c += 1
        n &= n - 1
    return c

def getUSBports (json_file):
    ports_json_file = open(json_file, 'r')
    ports_json_data = json.load(ports_json_file)
    ports_json_file.close()
    return ports_json_data


def RO_crossTalk(usb_port, cycles, threshold_value, data, is_random_data, baud, repeat):

    cycles_per_bit = cycles.to_bytes(4,'big')
    cycles_per_bit = [[cycles_per_bit[0]],[cycles_per_bit[1]],[cycles_per_bit[2]],[cycles_per_bit[3]]]
    threshold = threshold_value.to_bytes(4,'big')
    threshold = [[threshold[0]],[threshold[1]],[threshold[2]],[threshold[3]]]

    if(data == None and is_random_data == False):
        print("Error: Please specify input data or random data to be sent to the FPGA")
        sys.exit(0)

    if(data != None and is_random_data == True):
        print("Error: Do not specify input data and random data at the same time")
        sys.exit(0)

    # configure the serial connections (the parameters differs on the device you are connecting to)
    ser = serial.Serial(
        port=usb_port,
        baudrate=baud,
        parity=serial.PARITY_ODD,
        stopbits=serial.STOPBITS_TWO,
        bytesize=serial.EIGHTBITS
    )

    # Allow time for serial to intialize
    time.sleep(0.2)

    counter = 0

    #########################
    ## Clocks_per_bit
    ser.write(fsm_addr["SET_CLOCKS_PER_BIT_ADDR"])
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
    ser.write(fsm_addr["SET_THRESHOLD_ADDR"])
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

    if(is_random_data == True):
        initial_data = os.urandom(1)
    else:
        initial_data =  bytearray([data])
    print('Data sent from console  is:   '+ '{:08b}'.format(int.from_bytes(initial_data , byteorder=sys.byteorder)))

    while (counter < repeat):

        ser.write(fsm_addr["SET_PHANTOM_DATA_ADDR"])
        ser.write(initial_data)
        ser.write(fsm_addr["SET_START_CROSSTALK_ADDR"])
        time.sleep(0.5)
        ser.write(fsm_addr["GET_PHANTOM_RECEIVER_STATUS_ADDR"]) 
        isReady = ser.read()
        # print ("read fsm_addr["GET_PHANTOM_RECEIVER_STATUS_ADDR"]", isReady)

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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_ZERO_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_ONE_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_TWO_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_THREE_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_FOUR_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_FIVE_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_SIX_ADDR"]) 
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
        ser.write(fsm_addr["GET_DEBUG_ROCOUNTS_SEVEN_ADDR"]) 
        debugValue_seven = 0
        for i in range(4):
            tmp = ser.read()
            # print (tmp)
            debugValue_seven = debugValue_seven + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            time.sleep(0.5)
        print ("Read 32 bits for bit 7:", debugValue_seven)
        readValues_seven.append(debugValue_seven)
        #############################

        ser.write(fsm_addr["GET_FINAL_DATA_ADDR"])
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


    time.sleep(0.5)
    ser.write(fsm_addr["GET_DEBUG_TX_WIRE_ADDR"]) 
    rxWire = ser.read()
    print ("read rxWire", rxWire)

def generateAddr(verilogFile = "../verilog/address.sv"):
    destFile = "../software/addr.py"
    with open (destFile, "w") as fw:
        fw.write("fsm_addr = {\n")
        with open (verilogFile, "r") as fr:
            lines = fr.readlines()
            for l in lines:
                if ('_ADDR' in l):
                    fw.write("\t\"%s\": b\'\\x%s\',\n"%(l.split()[-2] , "0x{:02x}".format(int(l.split()[-1][3:],2))[2:]))
        fw.write("}\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('-c', '--choice', type=int, required=False, help='Choice')
    args = parser.parse_args()

    if (args.choice == 0):
        generateAddr()
    else:
        print ("Undefined choice!")



#!/usr/bin/python3.8

import time
import datetime
import serial
import os
import sys
import argparse
import numpy as np
from address import *

def getTimeStamp():
    time_now = str(datetime.datetime.now())
    time_now = time_now[0:10]+"_"+time_now[11:13]+"-"+time_now[14:16]+"-"+time_now[17:19]
    return time_now

def uart_write_byte(ser, val):
    # print ("Sending %d  %x"%(val, val))
    ser.write (val.to_bytes (1, byteorder='big'))

def uart_write_4bytes(ser, val):
    # print ("Sending %d  %x"%(val, val))
    ser.write ( ((val >> 24) & 0xFF).to_bytes (1, byteorder='big') )
    ser.write ( ((val >> 16) & 0xFF).to_bytes (1, byteorder='big') )
    ser.write ( ((val >> 8) & 0xFF).to_bytes (1, byteorder='big') )
    ser.write ( (val & 0xFF).to_bytes (1, byteorder='big') )

def set_up_tdc (ser, measures, config = 0xff, coarse = 0x7, fine = 0x0, nTDCs = 4):  # 0x1A for kc705-01 and 0x1F for kc705-02, 0x5 0x2, 0x9 0x2, 0xb 0x2, 0xc 0x2 for ac701
    print ("Setting up %d TDCs from FPGA"%(nTDCs))
    # Number of measurements
    uart_write_byte(ser, ADDR["SET_TDC_MEASUREMENT_NUM_ADDR"])
    uart_write_4bytes(ser, measures)
    # Config
    uart_write_byte(ser, ADDR["SET_TDC_CONFIG_ADDR"])
    uart_write_byte(ser, config)
    # Coarse
    uart_write_byte(ser, ADDR["SET_TDC_COARSE_ADDR"])
    uart_write_byte(ser, coarse)
    # Fine
    uart_write_byte(ser, ADDR["SET_TDC_FINE_ADDR"])
    uart_write_byte(ser, fine)

def reset_tdc(ser):
    uart_write_byte(ser, ADDR["SET_TDC_RESET_ADDR"])

def start_tdc(ser):
    uart_write_byte(ser, ADDR["SET_TDC_START_ADDR"])

def read_tdc (ser, tdc_idx):
    if (tdc_idx == 0):
        uart_write_byte(ser, ADDR["GET_TDC0_BYTE_ADDR"])
    elif (tdc_idx == 1):
        uart_write_byte(ser, ADDR["GET_TDC1_BYTE_ADDR"])
    elif (tdc_idx == 2):
        uart_write_byte(ser, ADDR["GET_TDC2_BYTE_ADDR"])
    elif (tdc_idx == 3):
        uart_write_byte(ser, ADDR["GET_TDC3_BYTE_ADDR"])
    # tdc_meas = ser.read()
    # tdc_meas = int(read32bitData(ser)/4096)
    tdc_meas = int(read32bitData(ser)/1024)
    # tdc_meas = int(read32bitData(ser)/128)
    # tdc_meas = int(read32bitData(ser))
    # tdc_meas = ord(tdc_meas)
    # print ("tdc %d measurement :  %d  %s "%(tdc_idx, tdc_meas, hex(tdc_meas)))
    return tdc_meas

def read32bitData(ser): 
        data = 0
        for i in range(4):
            tmp = ser.read()
            data = data + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
            # time.sleep(0.2)
        return data

def enable_ro_heater (ser, num_heaters):
    uart_write_byte(ser, ADDR["SET_RO_HEATER_ON_ADDR"])
    def set_heater_enable_val (a):
        base = 0xFF
        res = ((base << a) & base) ^ base
        print ("The RO heater enable value is  ", "{:08b}".format(res))
        return res
    uart_write_byte(ser, set_heater_enable_val(num_heaters))
    time.sleep(10) # remember to uncomment

def disable_ro_heater (ser):
    uart_write_byte(ser, ADDR["SET_RO_HEATER_OFF_ADDR"])
    time.sleep(10) # remember to uncomment sleep 300 originally

# def test(ser, measures, mesg):
#     ############################
#     # uart_write_byte(ser, ADDR["SET_LOCAL_STRESSOR_COUNT_CYCLES_ADDR"])
#     # uart_write_4bytes(ser, 15)
#     # time.sleep(2)
#     ############################
#     # Set up TDC
#     set_up_tdc(ser, measures)
#     reset_tdc(ser)
#     start_tdc(ser)
#     # time.sleep(5.2)
#     time.sleep(11)
#     # 4 TDCs, measures+2 records
#     data = np.zeros((4, measures+2))
#     for i in range(4):
#         for j in range(measures+2):
#             data[i][j] = read_tdc(ser, i)
#     out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(getTimeStamp(), measures, mesg)
#     # np.savez(out_data_file, data=data) # remember to uncomment
#     print (data, data.shape)
#     print ("Average : ", np.mean(data[:,:-2], axis=1))
#     data = data.tolist()
#     print(data[2])
#     print(len(data[2]))


def test(ser, measures, mesg):
    # Set up TDC
    # for a in range(0x0,0xff):
        # config = a
        for b in range(0x0,0x20):
        # for b in range(0x1a,0x1b):
            coarse = b
            for c in range(0x0,0x20):
            # for c in range(0x1f,0x20):
                fine = c
                print("")
                # print("config = ", config)
                print("coarse = ", hex(coarse))
                print("fine = ", hex(fine))
                set_up_tdc(ser, measures, config = 0xff, coarse = coarse, fine = fine, nTDCs = 4)
                reset_tdc(ser)
                start_tdc(ser)
                # 4 TDCs, measures+2 records
                data = np.zeros((4, measures+2))
                for i in range(4):
                    for j in range(measures+2):
                        data[i][j] = read_tdc(ser, i)
                out_data_file = "data/data_%s_4TDCs_%dmeasures_%s.npz"%(getTimeStamp(), measures, mesg)
                # np.savez(out_data_file, data=data)
                print (data, data.shape)
                print ("Average : ", np.mean(data[:,:-2], axis=1))


if __name__ == '__main__':
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port latency tester script.')
    parser.add_argument('-b', '--baud', default="921600", type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default="/dev/ttyUSB5", type=str, required=False, help='Serial port device name.')
    parser.add_argument('-c', '--choice', type=int, required=True, help='Choice')
    parser.add_argument('-n', '--nummeasures', default=5, type=int, required=False, help='Num measures.')
    parser.add_argument('--mesg', default="", type=str, required=False, help='Message from user.')
    args = parser.parse_args()

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

    if (args.choice == 0):
        # experiment
        test(ser, args.nummeasures, args.mesg)
    elif (args.choice == 1):
        # Turn on RO heater and wait for several min
        enable_ro_heater(ser, 8) # %d heaters out of 8 
    elif (args.choice == 2):
        # Turn off RO heater and wait for several min
        disable_ro_heater(ser)
    else:
        print ("Please make your choice!")


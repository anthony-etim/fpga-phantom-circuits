#!/usr/bin/python3.8
from audioop import avg
from cProfile import label
import numpy as np
import secrets
import math
from utilities import *
from matplotlib import pyplot as plt

# the data from this 
roCounts_heater_0 = []
roCounts_heater_1 = []
roCounts_heater_2 = []
roCounts_heater_3 = []

def ro_heater_measure(usb_port, baud, plot_path, ro_sensor_cycles, ro_sensor_cycles_offset,ro_heater_data,ro_heater_data_len,ro_heater_on_num):
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

    # reset from software
    ser.write(fsm_addr["SET_SW_RST_ADDR"])

    # set ro_sensor_cycles
    ser.write(fsm_addr["SET_RO_SENSOR_CYCLES"])
    d = splitBytes(ro_sensor_cycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("ro_sensor_cycles = %d cycles"%(ro_sensor_cycles))

    # set ro_sensor_cycles_offset
    ser.write(fsm_addr["SET_RO_SENSOR_CYCLES_OFFSET"])
    d = splitBytes(ro_sensor_cycles_offset)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    # ser.write(bytearray([int(math.log2(ro_sensor_cycles_offset))]))
    time.sleep(0.1)
    print ("ro_sensor_cycles_offset = %d "%(ro_sensor_cycles_offset))

    # set ro_heater_cycles
    ser.write(fsm_addr["SET_RO_HEATER_CYCLES"])
    time.sleep(0.1)

    # # set ro_heater_data_len
    # if(ro_heater_data_len > (2**255)):
    #     print("Error, num of bits should be less than 2 raised to the power of 255")
    #     exit()
    # ser.write(fsm_addr["SET_RO_HEATER_DATA_LEN"])
    # ser.write(bytearray([int(math.log2(ro_heater_data_len))]))
    # time.sleep(0.1)
    # print ("Ro Heater Data Length is  = %d bits"%(ro_heater_data_len))

    ####################################################
    # set ro_heater_data
    # if(ro_heater_data == None):
    #     ro_heater_data = '0x' + secrets.token_hex(int(ro_heater_data_len/4))[int(ro_heater_data_len/4):]
    # else:
    #     ro_heater_data = ro_heater_data
    # print("RO Heater Data is", ro_heater_data)
    # ro_heater_data_len_tmp = str(ro_heater_data_len + 2)
    # ro_heater_data = int(ro_heater_data,16) # convert to int first
    # ro_heater_data = format(ro_heater_data,'#0' + ro_heater_data_len_tmp + 'b')
    # ro_heater_data = ro_heater_data.replace("0b","")

    # ser.write(fsm_addr["SET_RO_HEATER_DATA"])
    # ro_heater_data = bitstring_to_bytes(ro_heater_data)
    
    # for i in range(len(ro_heater_data)):
    #     ser.write(bytearray([ro_heater_data[i]]))
    #     time.sleep(0.1)
    # print ("Set Ro heater data as %s"%(ro_heater_data))
    ####################################################

    # set ro_heater_on_num
    ser.write(fsm_addr["SET_RO_HEATER_ON_NUM"])
    d = splitBytes(ro_heater_on_num)
    for i in range(4):
        ser.write(bytearray(d[i]))
    time.sleep(0.1)
    print ("ro_heater_on_num = %d "%(ro_heater_on_num))

    # # Debug signal
    # for i in range(10):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)

    # start ro heater
    ser.write(fsm_addr["SET_RO_HEATER_START"])
    # wait for the ro heater
    time.sleep(4)

    # print("   ")
    # # Debug signal
    # for i in range(10):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)

    # read RO counts for ro sensor_0
    fifo_address= ["GET_RO_HEATER_FIFO_ADDR_0"]
    for j in range(1024): ## depth of FIFO
        data = read32bitData(ser, addr=fifo_address[0])
        roCounts_heater_0.append(data)
        time.sleep(0.1)
    # wait for 2 s
    time.sleep(2)

    # read RO counts for ro sensor_1
    fifo_address= ["GET_RO_HEATER_FIFO_ADDR_1"]
    for j in range(1024): ## depth of FIFO
        data = read32bitData(ser, addr=fifo_address[0])
        roCounts_heater_1.append(data)
        time.sleep(0.1)
    # wait for 2 s
    time.sleep(2)

    # read RO counts for ro sensor_2
    fifo_address= ["GET_RO_HEATER_FIFO_ADDR_2"]
    for j in range(1024): ## depth of FIFO
        data = read32bitData(ser, addr=fifo_address[0])
        roCounts_heater_2.append(data)
        time.sleep(0.1)
    # wait for 2 s
    time.sleep(2)

    # read RO counts for ro sensor_3
    fifo_address= ["GET_RO_HEATER_FIFO_ADDR_3"]
    for j in range(1024): ## depth of FIFO
        data = read32bitData(ser, addr=fifo_address[0])
        roCounts_heater_3.append(data)
        time.sleep(0.1)
    # wait for 2 s
    time.sleep(2)

    # # Debug signal
    # for i in range(10):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)

    #######################################
    # Plot RO SENSOR 0 DATA
    # if(ro_heater_data == None):
    #     ro_heater_data = "random"
    # else:
    #     ro_heater_data = str(ro_heater_data)
    ro_counts_drop_0 = ((np.mean(roCounts_heater_0[975:1024])-np.mean(roCounts_heater_0[425:470]))/np.mean(roCounts_heater_0[975:1024])) *100
    print("")
    print("ro counts percent drop is %.2f %%",ro_counts_drop_0)
    plt.plot(roCounts_heater_0, "r+")
    plt.xlabel("Measurement Number")
    plt.ylabel("RO Counts")
    plt.title('RO COUNTS')
    # plt.ylim(1900000,2630000)
    plt.show()
    plt.savefig(plot_path + "ro_heater_sensor_0_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) +".png")
    plt.clf()
    #######################################

    #######################################
    # Plot RO SENSOR 1 DATA
    # if(ro_heater_data == None):
    #     ro_heater_data = "random"
    # else:
    #     ro_heater_data = str(ro_heater_data)
    ro_counts_drop_1 = ((np.mean(roCounts_heater_1[975:1024])-np.mean(roCounts_heater_1[425:470]))/np.mean(roCounts_heater_1[975:1024])) *100
    print("")
    print("ro counts percent drop is %.2f %%",ro_counts_drop_1)
    plt.plot(roCounts_heater_1, "r+")
    plt.xlabel("Measurement Number")
    plt.ylabel("RO Counts")
    plt.title('RO COUNTS')
    # plt.ylim(1900000,2630000)
    plt.show()
    plt.savefig(plot_path + "ro_heater_sensor_1_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) +".png")
    plt.clf()
    #######################################

    #######################################
    # Plot RO SENSOR 2 DATA
    # if(ro_heater_data == None):
    #     ro_heater_data = "random"
    # else:
    #     ro_heater_data = str(ro_heater_data)
    ro_counts_drop_2 = ((np.mean(roCounts_heater_2[975:1024])-np.mean(roCounts_heater_2[425:470]))/np.mean(roCounts_heater_2[975:1024])) *100
    print("")
    print("ro counts percent drop is %.2f %%",ro_counts_drop_2)
    plt.plot(roCounts_heater_2, "r+")
    plt.xlabel("Measurement Number")
    plt.ylabel("RO Counts")
    plt.title('RO COUNTS')
    # plt.ylim(1900000,2630000)
    plt.show()
    plt.savefig(plot_path + "ro_heater_sensor_2_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) +".png")
    plt.clf()
    #######################################

    #######################################
    # Plot RO SENSOR 3 DATA
    # if(ro_heater_data == None):
    #     ro_heater_data = "random"
    # else:
    #     ro_heater_data = str(ro_heater_data)
    ro_counts_drop_3 = ((np.mean(roCounts_heater_3[975:1024])-np.mean(roCounts_heater_3[425:470]))/np.mean(roCounts_heater_3[975:1024])) *100
    print("")
    print("ro counts percent drop is %.2f %%",ro_counts_drop_3)
    plt.plot(roCounts_heater_3, "r+")
    plt.xlabel("Measurement Number")
    plt.ylabel("RO Counts")
    plt.title('RO COUNTS')
    # plt.ylim(1900000,2630000)
    plt.show()
    plt.savefig(plot_path + "ro_heater_sensor_3_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) +".png")
    plt.clf()
    #######################################

    

if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-j', '--json', default=HOME+'/ccf/ports.json', type=str, required=False, help='Location of the JSON file.')
    parser.add_argument('-d', '--data', default=0xFF, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('--bit', default=None, type=str, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-n', '--num_measurements', default=10, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('--num_tx_bits', default=4, type=int, required=False, help='Number of tx bits.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    parser.add_argument('--cooldown_cycles', default=4194304, type=int, required=False, help='Cooldown cycles') 
    parser.add_argument('--delay_cycles', default=4194304, type=int, required=False, help='Tx bit Delay cycles') 
    parser.add_argument('--useTXRO', action='store_true')
    args = parser.parse_args()
    
    # read USB port name
    ports_json_data = getUSBports(args.json)
    fpgas = list(ports_json_data.keys())
    usb_port = ports_json_data[fpgas[0]]['uartport']
    print ("USB port %s"%(usb_port))
   
    num_measurements = args.num_measurements
    num_tx_bits = args.num_tx_bits
    cooldown_cycles= args.cooldown_cycles
    delay_cycles = args.delay_cycles
    tx = args.bit

    ro_sensor_cycles = 2**15
    ro_heater_on_num = 5
    data_path = '/home/aee38/Documents/fpga-phantom-circuits/src/system_top/experiments/ro_heater/data/'
    plot_path = '/home/aee38/Documents/fpga-phantom-circuits/src/system_top/experiments/ro_heater/plots/'

    ro_heater_measure(usb_port, args.baud, plot_path, ro_sensor_cycles=ro_sensor_cycles, ro_sensor_cycles_offset=2**6, ro_heater_data='0xaa',ro_heater_data_len=8,ro_heater_on_num=ro_heater_on_num)
    
    # save roCounts heater data to file       
    dFileName = "data_rep_ro_heater_sensor_0_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_0))
    saveToFile(roCounts_heater_0, "%s.txt"%(data_path + dFileName))

    # save roCounts heater data to file       
    dFileName = "data_rep_ro_heater_sensor_1_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_1))
    saveToFile(roCounts_heater_1, "%s.txt"%(data_path + dFileName))
    
    # save roCounts heater data to file       
    dFileName = "data_rep_ro_heater_sensor_2_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_2))
    saveToFile(roCounts_heater_2, "%s.txt"%(data_path + dFileName))
    

    # save roCounts heater data to file       
    dFileName = "data_rep_ro_heater_sensor_3_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_3))
    saveToFile(roCounts_heater_3, "%s.txt"%(data_path + dFileName))
    
    
   
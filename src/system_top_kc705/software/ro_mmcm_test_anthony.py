#!/usr/bin/python3.8
import numpy as np
from utilities import *
from matplotlib import pyplot as plt

ro_counts   = []
mmcm_counts = []

def count_experiment(usb_port, baud):
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

    # time.sleep(1)
    # for i in range (100):
    #     mmcm = read32bitData(ser, addr = "GET_MMCM_LOCKED_STATUS")
    #     print ("MMCM_LOCKED_STATUS:", mmcm)

     # start tx
    ser.write(fsm_addr["SET_PHANTOM_START_ADDR"])
    # wait for the RO 
    time.sleep(4)

    # for i in range (100):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)

    for i in range (10000):
        ro = read32bitData(ser, addr = "GET_RO_COUNTS")
        print ("ro counts: ", ro)
        ro_counts.append(ro)
    
    for i in range (10000):
        mmcm = read32bitData(ser, addr = "GET_MMCM_COUNTS")
        print ("mmcm counts: ", mmcm)
        mmcm_counts.append(mmcm)

if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default="/dev/ttyUSB5", type=str, required=False, help='Serial port device name.')
    # parser.add_argument('-j', '--json', default=HOME+'/ccf/ports.json', type=str, required=False, help='Location of the JSON file.')
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-n', '--num_measurements', default=10, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    parser.add_argument('--useTXRO', action='store_true')
    args = parser.parse_args()

   # read USB port name
    # ports_json_data = getUSBports(args.json)
    # fpgas = list(ports_json_data.keys())
    # usb_port = ports_json_data[fpgas[0]]['uartport']
    
    usb_port = args.port
    print ("USB port %s"%(usb_port))

    count_experiment(usb_port, args.baud)

    ro_counts = np.array(ro_counts)/100000 *200
    mmcm_counts = np.array(mmcm_counts)/100000 *200

    
    fig_ro = plt.hist(ro_counts, bins='auto')
    plt.title('RO COUNTS HISTOGRAM')
    plt.xlabel("RO Frequency (MHz)")
    plt.ylabel("Frequency")
    plt.savefig("ro_counts.png")
    plt.clf()

   
    fig_mmcm = plt.hist(mmcm_counts, bins='auto')
    plt.title('MMCM COUNTS HISTOGRAM')
    plt.xlabel("Mmcm Frequency (MHz)")
    plt.ylabel("Frequency")
    plt.savefig("mmcm_counts.png")
    plt.clf()



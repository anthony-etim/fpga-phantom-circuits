#!/usr/bin/python3.8
import numpy as np
from utilities import *



def phantum_experiment_init(usb_port, baud, delayCycles, tx_delayTime, tx=None):
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
    # set delay time
    ser.write(fsm_addr["SET_DELAY_PH_ADDR"])
    d = splitBytes(delayCycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("delayCycles = %d cycles"%(delayCycles))

    # set tx delay time
    ser.write(fsm_addr["SET_DELAY_TX_ADDR"])
    d = splitBytes(tx_delayTime)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("TX waits for %d cycles before assertion"%(tx_delayTime))
   
    # repeat for num_rep times
    rawData = []
    num_rep = 1
    for i in range(num_rep):
        # the data from this run
        roCounts = [[],[],[],[]]
        # set tx bit
        ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
        if (tx == None):
            txValue = (i+1)%2
        else:
            txValue = tx
        ser.write(bytearray([txValue]))
        print ("Set TX wire as %d"%(txValue))
        
        # measure ro before tx wire is asserted
        ser.write(fsm_addr["SET_INITIAL_MEASURE"])
        time.sleep(4)

        # Debug signal
        # for i in range (100):
        #     phan = read32bitData(ser, addr = "GET_PHAN_START")
        #     print ("DEBUG:", phan)
       
        # read debug signal
        data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
        print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))
        # read RO counts for numTraces
        fifo_addresses = ["GET_PHAN_FIFO_0_ADDR", "GET_PHAN_FIFO_1_ADDR", 
                            "GET_PHAN_FIFO_2_ADDR", "GET_PHAN_FIFO_3_ADDR"]
        for n in range(22):# numTraces 10, for each counter, we read 10 entries
            for j in range(4):
                # 4 FIFOs
                data = read32bitData(ser, addr=fifo_addresses[j])
                roCounts[j].append(data)
                # print (hex(data))
                time.sleep(0.1)
        rawData.append(roCounts)
        # wait for 1 s
        time.sleep(2)
    data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))
    
    # Ro average counts
    ro_avg_0 = read32bitData(ser, addr = "GET_RO_AVERAGE_0")
    print ("RO_AVERAGE_0:", ro_avg_0)

    ro_avg_1 = read32bitData(ser, addr = "GET_RO_AVERAGE_1")
    print ("RO_AVERAGE_1:", ro_avg_1)

    ro_avg_2 = read32bitData(ser, addr = "GET_RO_AVERAGE_2")
    print ("RO_AVERAGE_2:", ro_avg_2)

    ro_avg_3 = read32bitData(ser, addr = "GET_RO_AVERAGE_3")
    print ("RO_AVERAGE_3:", ro_avg_3)

    print(rawData)

    # save data to file
    dFileName = "data_rep_phantum_init%d_%s"%(num_rep, timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s\n\n"%(saveFile))
    np.savez_compressed(saveFile, data=np.asarray(rawData))
    saveToFile(rawData, "%s.txt"%(dFileName))

def phantum_experiment_measure(usb_port, baud, delayCycles, tx_delayTime, tx=None):
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
    # set delay time
    ser.write(fsm_addr["SET_DELAY_PH_ADDR"])
    d = splitBytes(delayCycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("delayCycles = %d cycles"%(delayCycles))

    # set tx delay time
    ser.write(fsm_addr["SET_DELAY_TX_ADDR"])
    d = splitBytes(tx_delayTime)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("TX waits for %d cycles before assertion"%(tx_delayTime))
   
    # repeat for num_rep times
    rawData = []
    num_rep = 1
    for i in range(num_rep):
        # the data from this run
        roCounts = [[],[],[],[]]
        # set tx bit
        ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
        if (tx == None):
            txValue = (i+1)%2
        else:
            txValue = tx
        ser.write(bytearray([txValue]))
        print ("Set TX wire as %d"%(txValue))

        # start tx
        ser.write(fsm_addr["SET_PHANTOM_START_ADDR"])
        # wait for the RO 
        time.sleep(4)

        
       
        # read debug signal
        data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
        print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))
        # read RO counts for numTraces
        fifo_addresses = ["GET_PHAN_FIFO_0_ADDR", "GET_PHAN_FIFO_1_ADDR", 
                            "GET_PHAN_FIFO_2_ADDR", "GET_PHAN_FIFO_3_ADDR"]
        for n in range(22):# numTraces 10, for each counter, we read 10 entries
            for j in range(4):
                # 4 FIFOs
                data = read32bitData(ser, addr=fifo_addresses[j])
                roCounts[j].append(data)
                # print (hex(data))
                time.sleep(0.1)
        rawData.append(roCounts)
        # wait for 1 s
        time.sleep(2)
    data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))

    # Ro average counts
    ro_avg_0 = read32bitData(ser, addr = "GET_RO_AVERAGE_0")
    print ("RO_AVERAGE_0:", ro_avg_0)

    ro_avg_1 = read32bitData(ser, addr = "GET_RO_AVERAGE_1")
    print ("RO_AVERAGE_1:", ro_avg_1)

    ro_avg_2 = read32bitData(ser, addr = "GET_RO_AVERAGE_2")
    print ("RO_AVERAGE_2:", ro_avg_2)

    ro_avg_3 = read32bitData(ser, addr = "GET_RO_AVERAGE_3")
    print ("RO_AVERAGE_3:", ro_avg_3)

    print(rawData)

    # Debug signal
    for i in range (1000):
        phan = read32bitData(ser, addr = "GET_PHAN_START")
        print ("DEBUG:", phan)

    for i in range (1):
        data_0 = read32bitData(ser, addr = "GET_DATA_0")
        print ("DATA_0:", data_0)

        data_1 = read32bitData(ser, addr = "GET_DATA_1")
        print ("DATA_1:", data_1)

        data_2 = read32bitData(ser, addr = "GET_DATA_2")
        print ("DATA_2:", data_2)

        data_3 = read32bitData(ser, addr = "GET_DATA_3")
        print ("DATA_3:", data_3)

    # save data to file
    dFileName = "data_rep_phantum_measure%d_%s"%(num_rep, timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s\n\n"%(saveFile))
    np.savez_compressed(saveFile, data=np.asarray(rawData))
    saveToFile(rawData, "%s.txt"%(dFileName))

def phantum_experiment_final(usb_port, baud, delayCycles, tx_delayTime, tx=None):
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
    # set delay time
    ser.write(fsm_addr["SET_DELAY_PH_ADDR"])
    d = splitBytes(delayCycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("delayCycles = %d cycles"%(delayCycles))

    # set tx delay time
    ser.write(fsm_addr["SET_DELAY_TX_ADDR"])
    d = splitBytes(tx_delayTime)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("TX waits for %d cycles before assertion"%(tx_delayTime))
   
    # repeat for num_rep times
    rawData = []
    num_rep = 1
    for i in range(num_rep):
        # the data from this run
        roCounts = [[],[],[],[]]
        # set tx bit
        ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
        if (tx == None):
            txValue = (i+1)%2
        else:
            txValue = tx
        ser.write(bytearray([txValue]))
        print ("Set TX wire as %d"%(txValue))
        
        # measure ro after tx wire has been asserted
        ser.write(fsm_addr["SET_FINAL_MEASURE"])
        time.sleep(4)

        # Debug signal
        # for i in range (100):
        #     phan = read32bitData(ser, addr = "GET_PHAN_START")
        #     print ("DEBUG:", phan)
       
        # read debug signal
        data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
        print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))
        # read RO counts for numTraces
        fifo_addresses = ["GET_PHAN_FIFO_0_ADDR", "GET_PHAN_FIFO_1_ADDR", 
                            "GET_PHAN_FIFO_2_ADDR", "GET_PHAN_FIFO_3_ADDR"]
        for n in range(22):# numTraces 10, for each counter, we read 10 entries
            for j in range(4):
                # 4 FIFOs
                data = read32bitData(ser, addr=fifo_addresses[j])
                roCounts[j].append(data)
                # print (hex(data))
                time.sleep(0.1)
        rawData.append(roCounts)
        # wait for 1 s
        time.sleep(2)
    data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))

    # Ro average counts
    ro_avg_0 = read32bitData(ser, addr = "GET_RO_AVERAGE_0")
    print ("RO_AVERAGE_0:", ro_avg_0)

    ro_avg_1 = read32bitData(ser, addr = "GET_RO_AVERAGE_1")
    print ("RO_AVERAGE_1:", ro_avg_1)

    ro_avg_2 = read32bitData(ser, addr = "GET_RO_AVERAGE_2")
    print ("RO_AVERAGE_2:", ro_avg_2)

    ro_avg_3 = read32bitData(ser, addr = "GET_RO_AVERAGE_3")
    print ("RO_AVERAGE_3:", ro_avg_3)

    print(rawData)

    # save data to file
    dFileName = "data_rep_phantum_final%d_%s"%(num_rep, timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(saveFile, data=np.asarray(rawData))
    saveToFile(rawData, "%s.txt"%(dFileName))

def test(usb_port, baud, delayCycles, tx_delayTime, tx=None):
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

    
    # Debug signal
    # for i in range (10000):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)


if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-j', '--json', default=HOME+'/ccf/ports.json', type=str, required=False, help='Location of the JSON file.')
    parser.add_argument('-d', '--data', default=0xFF, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('--bit', default=None, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-n', '--num_measurements', default=10, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    parser.add_argument('--useTXRO', action='store_true')
    args = parser.parse_args()
    
    # read USB port name
    ports_json_data = getUSBports(args.json)
    fpgas = list(ports_json_data.keys())
    usb_port = ports_json_data[fpgas[0]]['uartport']
    print ("USB port %s"%(usb_port))
    # RO_crossTalk(usb_port, args.cycles, args.threshold_value, args.data, args.is_random_data, args.baud, args.repeat)
    
    
    
    # ######## TDC cross talk
    # if (args.bit == 0):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x9, fineReg = 0x9, data=0)
    # elif (args.bit == 1):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x10, fineReg = 0x10, data=0xFF)
   
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**23, tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    ## phantum_experiment_init(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    #phantum_experiment_measure(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    test(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    ## phantum_experiment_final(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**27, tx_delayTime=2**30, tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 32, tx=args.bit)

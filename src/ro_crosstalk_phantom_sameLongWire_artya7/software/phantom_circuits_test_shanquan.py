#!/usr/bin/python3.8

from utilities import *



def phantum_experiment(usb_port, baud, delayCycles, tx=None):
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
    # set tx delay time
    ser.write(fsm_addr["SET_DELAY_TX_ADDR"])
    d = splitBytes(delayCycles*5)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)

    # ser.write(fsm_addr['GET_DEBUG1_PHAN_ADDR']) 
    # tmp = ser.read()
    # print ("GET_DEBUG1_PHAN_ADDR", tmp)
    # data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    # print ("GET_DEBUG0_PHAN_ADDR", data)

    # repeat for 10 times

    roCounts = [[],[],[],[]]
    num_rep = 1
    for i in range(num_rep):
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
        time.sleep(2)
        # read ddebug signal
        data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
        print ("debug0", data)
        # read RO counts for numTraces
        fifo_addresses = ["GET_PHAN_FIFO_0_ADDR", "GET_PHAN_FIFO_1_ADDR", 
                            "GET_PHAN_FIFO_2_ADDR", "GET_PHAN_FIFO_3_ADDR"]
        for n in range(10):# numTraces 10, for each counter, we read 10 entries
            for j in range(4):
                # 4 FIFOs
                data = read32bitData(ser, addr=fifo_addresses[j])
                roCounts[j].append(data)
                # print (hex(data))
                time.sleep(0.2)

    for d in roCounts:
        # print (d, "ave %f"%(sum(d)/len(d)))
        print (d)

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

    phantum_experiment(usb_port, args.baud, delayCycles= 2**22, tx=args.bit)





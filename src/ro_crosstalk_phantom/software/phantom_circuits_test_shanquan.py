#!/usr/bin/python3.8

from utilities import *



def phantum_experiment(usb_port, baud, delayCycles=9_000_000, tx=None):
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
    ser.write(fsm_addr["SET_DELAY_TT_ADDR"])
    d = splitBytes(delayCycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    # repeat for 10 times
    ro0=[]
    ro1=[]
    num_rep = 10
    for i in range(num_rep):
        # set tx bit
        ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
        if (tx == None):
            txValue = i%2
        else:
            txValue = tx
        ser.write(bytearray([txValue]))
        print ("Set TX wire as %d"%(txValue))
        # start tx
        ser.write(fsm_addr["SET_PHANTOM_START_ADDR"])
        # wait for the RO 
        time.sleep(2)
        # read RO counts
        data = read32bitData(ser, addr="GET_DEBUG0_PHAN_ADDR")
        ro0.append(data)
        print (data)
        data = read32bitData(ser, addr="GET_DEBUG1_PHAN_ADDR")
        ro1.append(data)
        print (data)
        time.sleep(1)
    # print ("Average %f, range %d"%(sum(ro0)/len(ro0), max(ro0)-min(ro0)))
    # print ("Average %f, range %d"%(sum(ro1)/len(ro1), max(ro1)-min(ro1)))
    print ("Average %f"%(sum(ro0)/len(ro0)))
    for i in range(0,num_rep,2):
        print ("Range %d"%(ro0[i+1]-ro0[i]))
    print ("Average %f"%(sum(ro1)/len(ro1)))
    for i in range(0,num_rep,2):
        print ("Range %d"%(ro1[i+1]-ro1[i]))



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

    # RO_crossTalk(usb_port, args.cycles, args.threshold_value, args.data, args.is_random_data, args.baud, args.repeat)



    # ######## TDC cross talk
    # if (args.bit == 0):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x9, fineReg = 0x9, data=0)
    # elif (args.bit == 1):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x10, fineReg = 0x10, data=0xFF)

    phantum_experiment(usb_port, args.baud, tx=args.bit)



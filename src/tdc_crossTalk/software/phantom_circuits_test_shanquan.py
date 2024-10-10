#!/usr/bin/python3.8

from utilities import *




def splitBytes(data):
    d = data.to_bytes(4,'big')
    data_bytes = [[d[0]],[d[1]],[d[2]],[d[3]]]
    return data_bytes

def startSignal(ser):
    ser.write(fsm_addr["TDC_SET_START_ADDR"])
    time.sleep(0.1)

def resetTDC(ser):
    ser.write(fsm_addr["TDC_SET_RESET_ADDR"])
    time.sleep(0.1)

def read32bitData(ser, addr="TDC_GET_FIFO0_ADDR"):
    ser.write(fsm_addr[addr]) 
    data = 0
    for i in range(4):
        tmp = ser.read()
        data = data + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
        # time.sleep(0.2)
    return data

def read256bitTDC(ser):
    data = 0
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO7_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO6_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO5_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO4_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO3_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO2_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO1_ADDR")
    data = (data << 32) + read32bitData(ser, addr="TDC_GET_FIFO0_ADDR")
    # print ("Read " + '{:0256b}'.format(data))
    print ("Read " + '{:064x}'.format(data))
    return data

def readTDCstatus(ser):
    ser.write(fsm_addr["TDC_GET_STATUS_ADDR"]) 
    data = 0
    for i in range(4):
        tmp = ser.read()
        data = data + (int.from_bytes(tmp , byteorder=sys.byteorder) << (i * 8))
    print ("TDC status " + '{:032b}'.format(data))
    return data

def setTXWire(ser, data = bytearray([0x0])):
    ser.write(fsm_addr["SET_PHANTOM_DATA_ADDR"])
    ser.write(data)
    ser.write(fsm_addr["SET_START_CROSSTALK_ADDR"])
    time.sleep(0.2)


def testTDC(usb_port, baud, num_measurements = 10, coarseReg = 0x10, fineReg = 0x10, data = 0xFF):
    ## Tune TDC
    # If TDC outputs all FFs, you need to make the clock faster or the path shorter( smaller coarse and fine config values).
    # If TDC outputs all 0s, you need to make the clock slower or the path longer( bigger coarse and fine config values).

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
    
    # set the measurement number
    ser.write(fsm_addr["TDC_SET_MEASUREMENT_NUM_ADDR"])
    d = splitBytes(num_measurements*5)# e.g. 50 clock cycles means 10 measurements
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    # set the tdcConfigReg
    ser.write(fsm_addr["TDC_SET_CONFIG_ADDR"])
    ser.write(bytearray([0xFF]))
    # set the coarse reg
    ser.write(fsm_addr["TDC_SET_COARSE_ADDR"])
    ser.write(bytearray([coarseReg]))
    # set the fine reg
    ser.write(fsm_addr["TDC_SET_FINE_ADDR"])
    ser.write(bytearray([fineReg]))
    # set tx wire
    # setTXWire(ser, data = bytearray([0xFF]))
    setTXWire(ser, data = bytearray([data]))

    # read TDC status
    readTDCstatus(ser)
    
    # reset and start
    resetTDC(ser)
    startSignal(ser)

    # read TDC status
    readTDCstatus(ser)

    # read FIFO data
    hammingWeights = []
    for i in range(num_measurements+2):
        d = read256bitTDC(ser)
        hammingWeights.append(HM(d))
        # print ("Next")

    # summary of data
    print (hammingWeights)
    hammingWeights=hammingWeights[:-2]
    print ("N = %d, Ave = %f\t Max = %d\t Min = %d"%(len(hammingWeights), sum(hammingWeights)/len(hammingWeights), max(hammingWeights), min(hammingWeights)  ))



if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-j', '--json', default=HOME+'/ccf/ports.json', type=str, required=False, help='Location of the JSON file.')
    parser.add_argument('-d', '--data', default=0xFF, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('--bit', default=1, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-n', '--num_measurements', default=10, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    args = parser.parse_args()

    # read USB port name
    ports_json_data = getUSBports(args.json)
    fpgas = list(ports_json_data.keys())
    usb_port = ports_json_data[fpgas[0]]['uartport']

    # RO_crossTalk(usb_port, args.cycles, args.threshold_value, args.data, args.is_random_data, args.baud, args.repeat)



    ######## TDC cross talk
    if (args.bit == 0):
        testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x10, fineReg = 0x10, data=0)
    elif (args.bit == 1):
        testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x10, fineReg = 0x10, data=0xFF)





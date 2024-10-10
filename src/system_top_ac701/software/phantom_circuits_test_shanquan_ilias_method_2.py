#!/usr/bin/python3.8
from cProfile import label
import numpy as np
import secrets
import math
from utilities import *
from matplotlib import pyplot as plt


# the data from this 
roCounts      = [[],[],[],[]]
roCounts_zero = [[],[],[],[]]
roCounts_one  = [[],[],[],[]]
tx_bits_ref   = []

def phantum_experiment_measure(usb_port, baud, delay_cycles, tx_delayTime, threshold, cooldown_cycles, num_tx_bits, roCounts, tx,tx_bits_ref):
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
    d = splitBytes(delay_cycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("delayCycles = %d cycles"%(delay_cycles))

    # set tx delay time
    ser.write(fsm_addr["SET_DELAY_TX_ADDR"])
    d = splitBytes(tx_delayTime)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("TX waits for %d cycles before assertion"%(tx_delayTime))

    # set threshold
    ser.write(fsm_addr["SET_THRESHOLD_ADDR"])
    d = splitBytes(threshold)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("threshold = %d cycles"%(threshold))

    # set cooldown_cycles
    ser.write(fsm_addr["SET_COOLDOWN_CYCLES"])
    d = splitBytes(cooldown_cycles)
    for i in range(4):
        ser.write(bytearray(d[i]))
        time.sleep(0.1)
    print ("cooldown_cycles = %d cycles"%(cooldown_cycles))

    # set number of tx bits
    num_tx_bits_tmp = num_tx_bits
    num_tx_bits = num_tx_bits * 2
    if(num_tx_bits > (2**255)):
        print("Error, num of bits should be less than 2 raised to the power of 255")
        exit()
    ser.write(fsm_addr["SET_NUM_TX_BITS"])
    ser.write(bytearray([int(math.log2(num_tx_bits))]))
    time.sleep(0.1)
    print ("Number of tx bits with manchester encoding is  = %d bits"%(num_tx_bits))

    ########################
    ## Manchester encoding txdata
    if(tx == None):
        tx_data = '0x' + secrets.token_hex(int(num_tx_bits_tmp/4))[int(num_tx_bits_tmp/4):]
    else:
        tx_data = tx
    print("Random Data is", tx_data)
    num_tx_bits_tmp = str(num_tx_bits_tmp + 2)
    # tx_data = tx
    tx_data = int(tx_data,16) # convert to int first
    # tx_data = bin(data)
    tx_data = format(tx_data,'#0' + num_tx_bits_tmp + 'b')
    tx_data = tx_data.replace("0b","")
    tx_data_new = ""
    for i in range(len(tx_data)):
        # print(tx_data)
        if(tx_data[i]=="1"):
            tx_data_new += "01"
        else:
            tx_data_new += "10"
    # print(tx_data_new)
    # tx_data_new = int(tx_data_new,2)
    # tx_data_new = hex(tx_data_new)
    # print(tx_data_new)
    #########################

   
    # repeat for num_rep times
    rawData = []
    num_rep = 1
    for i in range(num_rep):
        # # the data from this run
        # roCounts = [[],[],[],[]]
        # set tx bit
        ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
        # if (tx == None):
        #     # txValue = (i+1)%2
        #     txValue = 102 # manchester encode of 10
        # else:
        txValue = bitstring_to_bytes(tx_data_new)
        
        for i in range(len(txValue)):
            ser.write(bytearray([txValue[i]]))
            time.sleep(0.1)
        # print ("Set TX wire as %d"%(txValue))
        print ("Set TX wire as %s"%(tx_data_new))


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
        for n in range(num_tx_bits):# numTraces 4, for each counter, we read 10 entries
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
    
    ##############################
    ## tx bits reference
    ##############################
    for m in range(len(tx_data)):
        tx_bits_ref.append(int(tx_data[m]))
    ##############################


    # Debug signal
    # for i in range (2):
    #     phan = read32bitData(ser, addr = "GET_PHAN_START")
    #     print ("DEBUG:", phan)

    # Ro prev counts
    # ro_prev_0 = read32bitData(ser, addr = "GET_RO_COUNTS_PREV_0")
    # print ("GET_RO_PREV_0:", ro_prev_0)

    # ro_prev_1 = read32bitData(ser, addr = "GET_RO_COUNTS_PREV_1")
    # print ("GET_RO_PREV_1:", ro_prev_1)

    # ro_prev_2 = read32bitData(ser, addr = "GET_RO_COUNTS_PREV_2")
    # print ("GET_RO_PREV_2:", ro_prev_2)

    # ro_prev_3 = read32bitData(ser, addr = "GET_RO_COUNTS_PREV_3")
    # print ("GET_RO_PREV_3:", ro_prev_3)


def analysis(file,num_measurements,tx,tx_bits_ref,num_tx_bits,cooldown_cycles,delay_cycles):
    tx_bits  =     []
    tx_bits_diff = [[],[],[],[]]
    error_count  = []
    best_offset  = []
    best_offset_new = []

    roCounts = np.load(file)['data']

    for i in range(4):
        for j in range(0,len(roCounts[i]),2):
            tx_bits_diff[i].append(roCounts[i][j]-roCounts[i][j+1])
        print(tx_bits_diff[i])
    
    for i in range(len(tx_bits_diff[0])):
        for j in range(4):
            best_offset.append((tx_bits_diff[j][i]))
   
    best_offset = list(split(best_offset,num_tx_bits*num_measurements))
    print("")

    for i in range(num_tx_bits*num_measurements):
        print(best_offset[i])
        res = sum(best_offset[i])
        best_offset_new.append(res)  
        
    # Determining tx bits data
    for i in range(len(best_offset_new)):
        if(best_offset_new[i] < 0):
            tx_bits.append(1)
        else:
            tx_bits.append(0)
    
    tx_bits = list(split(tx_bits,num_measurements))
    tx_bits_ref = list(split(tx_bits_ref,num_measurements))
    best_offset_new = list(split(best_offset_new,num_measurements))
    print("")
    print("offset data",best_offset_new)

    ##############################
    ## ERROR
    ##############################
    count = 0
    # for k in range(4):
    for l in range(num_measurements):
        for m in range(num_tx_bits):
            #print(((tx_bits[k][l][m])==(tx_bits_ref[k][l][m])))
            if((tx_bits[l][m])!=(tx_bits_ref[l][m])): # comparing tx bits to ref
                count = count + 1

        error_count.append(count*(100/num_tx_bits))
        count = 0

    print("Org",tx_bits)
    print("Ref",tx_bits_ref)
    print("Ect",error_count)
    print("")
    
    #######################################
    # Plot Counters
    # for i in range(len(error_count)):
    if(tx == None):
        txbit = "random"
    else:
        txbit = str(tx)
    x = list(range(0,num_measurements)) # num of measurements
    print(x)
    print(error_count)
    plt.plot(x,error_count, "ro")
    plt.xlabel("Measurement Number")
    plt.ylabel("Error %")
    plt.title('ERROR PERCENT_'  'OPTIMAL OFFSET '+ "txbit_" + txbit)
    plt.ylim(-1,100)
    plt.show()
    plt.savefig("counter_" +"optimal_" + str(int(num_tx_bits)) + "txbit_" + txbit + "_measure" + str(num_measurements) + "_cooldown" + str(cooldown_cycles) + "_cycles_per_bit" + str(delay_cycles) + ".png")
    plt.clf()
    #######################################

    #######################################
    # Index raw Data Plot
    # x = np.array(range(0,num_tx_bits)) # num of measurements
    # tx_array = np.array([num_tx_bits] * num_tx_bits)
    # for i in range(len(best_offset_new)):
    #     for j in range(num_tx_bits):
    #         if(index_offset[i][j] == 0):
    #             plt.plot(x[j],index_offset[i][j], "ro")
            
    #         if(index_offset[i][j] == 1):
    #             plt.plot(x[j],index_offset[i][j], "go")
            
    #         if(index_offset[i][j] == 2):
    #             plt.plot(x[j],index_offset[i][j], "bo")
            
    #         if(index_offset[i][j] == 3):
    #             plt.plot(x[j],index_offset[i][j], "ko")
    #     x += tx_array  
    # plt.xlabel("Bit Number")      
    # plt.ylabel("Offset Number")
    # plt.title('OPTIMAL OFFSET Number')
    # plt.show()
    # plt.savefig("absolute_offset_random_bits.png")
    # print(index_offset)

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
    # RO_crossTalk(usb_port, args.cycles, args.threshold_value, args.data, args.is_random_data, args.baud, args.repeat)
    
    ######## TDC cross talk
    # if (args.bit == 0):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x9, fineReg = 0x9, data=0)
    # elif (args.bit == 1):
    #     testTDC(usb_port, args.baud, num_measurements = args.num_measurements, coarseReg = 0x10, fineReg = 0x10, data=0xFF)
   
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**23, tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    #phantum_experiment_init(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
   
    num_measurements = args.num_measurements
    num_tx_bits = args.num_tx_bits
    cooldown_cycles= args.cooldown_cycles
    delay_cycles = args.delay_cycles
    tx = args.bit

    i = 0
    while i < num_measurements: 
        phantum_experiment_measure(usb_port, args.baud, delay_cycles= delay_cycles, tx_delayTime= int((2**24)*10), threshold= 900, cooldown_cycles= cooldown_cycles, num_tx_bits= num_tx_bits, roCounts=roCounts, tx=tx,tx_bits_ref=tx_bits_ref)
        print("")
        i = i + 1
    
    # time.sleep(4)
    
    # i = 0
    # while i < 1: 
    #     phantum_experiment_measure(usb_port, args.baud, delayCycles= 2**22, tx_delayTime= int((2**24)*10), threshold= 900, roCounts=roCounts_one, tx=15)
    #     print("")
    #     i = i + 
    
    #phantum_experiment_final(usb_port, args.baud, delayCycles= 2**24, tx_delayTime= int((2**24)*10), tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 2**27, tx_delayTime=2**30, tx=args.bit)
    # phantum_experiment(usb_port, args.baud, delayCycles= 32, tx=args.bit)

    # save data to file
    dFileName = "data_rep_phantum_measure%d_random_%d_bit_cooldown%d_cycles_per_bit%d_%s"%(num_measurements,num_tx_bits,cooldown_cycles, delay_cycles, timeStamp())
    saveFile = "%s.npz"%(dFileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(saveFile, data=np.asarray(roCounts))
    saveToFile(roCounts, "%s.txt"%(dFileName))

    # tx_bits_ref = list(split(tx_bits_ref,num_measurements))
    # print(tx_bits_ref)
    analysis(saveFile,num_measurements,tx,tx_bits_ref,num_tx_bits,cooldown_cycles,delay_cycles)

    ####################################
    ## Manchester Encoding Difference Plot
    # for i in range(4):
    #     difference_one =  [[],[],[],[]]
    #     difference_zero = [[],[],[],[]]
    #     even_samples    = [[],[],[],[]] 
    #     odd_samples     = [[],[],[],[]] 
        
    #     for j in range(num_measurements*4):
    #         if j % 2 == 1:
    #             odd_samples[i].append(j)
        
    #     for k in range(num_measurements*4):
    #         if k % 2 == 0:
    #             even_samples[i].append(k)

    #     # Remove all 2s
    #     # roCounts[i] = [j for j in roCounts[i] if j != 2]
    #     # print("\n", roCounts[i])  

    #     for l in range(0,len(roCounts[i]),4):
    #         difference_one[i].append((roCounts[i][l]-roCounts[i][l+1]))
    #         difference_zero[i].append((roCounts[i][l+2]-roCounts[i][l+3]))

    #     fig_ro_1 = plt.plot(even_samples[i], difference_one[i], 'ro', label="one difference")
    #     fig_ro_2 = plt.plot(odd_samples[i], difference_zero[i], 'bx', label="zero difference")
    #     plt.title('RO COUNTS_' + str(i) + ' OFFSET' + ' Manchester Encode difference')
    #     plt.legend(loc="best")
    #     plt.xlabel("Bit Number")
    #     plt.ylabel("RO Counts Difference")
    #     plt.savefig("ro_counts_offset" + str(i)+ "difference_" + str(num_measurements)+ ".png")
    #     plt.clf()
    ####################################

   ####################################
    ## Alternating 1's and 0's
    # if args.bit == 10:
    #     for i in range(4):
    #         roCounts_zero = [[],[],[],[]]
    #         roCounts_one  = [[],[],[],[]]
    #         # Remove all 2s
    #         # roCounts[i] = [j for j in roCounts[i] if j != 2]
    #         # print("\n", roCounts[i])
    #         for j in range(0,len(roCounts[i]),4):
    #             if roCounts[i].index(roCounts[i][j])%2 ==0:
    #                 # rocounts for 1's
    #                 roCounts_one[i].append(roCounts[i][roCounts[i].index(roCounts[i][j])])

    #             if roCounts[i].index(roCounts[i][j+2])%2 ==0:
    #                 # rocounts for 0's
    #                 roCounts_zero[i].append(roCounts[i][roCounts[i].index(roCounts[i][j+2])])
    #         # print("\n",roCounts_one[i])
    #         # print("\n",roCounts_zero[i])

    #         # roCounts[i] = roCounts_one[i] + roCounts_zero[i]
    #         # samples = [i+1 for i in range(len(roCounts[i]))]
    #         # print(samples)
    #         fig_ro_1 = plt.plot(roCounts_zero[i], 'bx', label="zero")
    #         fig_ro_2 = plt.plot(roCounts_one[i],  'r.', label="one")
    #         plt.title('RO COUNTS_' + str(i) + ' OFFSET' + ' Alternating 1010')
    #         plt.legend(loc="upper right")
    #         plt.xlabel("Samples")
    #         plt.ylabel("RO Counts")
    #         # plt.ylim(2054000, 2056000)
    #         plt.savefig("ro_counts_offset" + str(i)+ "measure_" + str(num_measurements)+ ".png")
    #         plt.clf()
    ####################################
    
    ####################################
    ## All 1s or All 0s Plot
    # i = 0
    # while i <= 3:
    #      # Remove all 2s
    #     roCounts[i] = [j for j in roCounts[i] if j != 2]
    #     # print("\n", roCounts[i])
    #     for j in roCounts[i]:
    #         if roCounts[i].index(j)%2 ==0:
    #             # rocounts for 1's
    #             roCounts_one[i].append(roCounts[i][roCounts[i].index(j)])
    #         else:
    #             # rocounts for 0's
    #             roCounts_zero[i].append(roCounts[i][roCounts[i].index(j)])
    #     # print("\n",roCounts_one[i])
    #     # print("\n",roCounts_zero[i])

    #     # roCounts[i] = roCounts_one[i] + roCounts_zero[i]
    #     # samples = [i+1 for i in range(len(roCounts[i]))]
    #     # print(samples)
    #     fig_ro_1 = plt.plot(roCounts_zero[i], 'bx', label="zero")
    #     fig_ro_2 = plt.plot(roCounts_one[i],  'r.', label="one")
    #     plt.title('RO COUNTS_' + str(i) + ' OFFSET')
    #     plt.legend(loc="upper right")
    #     plt.xlabel("Samples")
    #     plt.ylabel("Frequency")
    #     # plt.ylim(2054000, 2056000)
    #     plt.savefig("ro_counts_" + str(i)+ ".png")
    #     plt.clf()
    #     i = i + 1
    ####################################
    
   
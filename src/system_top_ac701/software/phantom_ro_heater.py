#!/usr/bin/python3.8
from audioop import avg
from cProfile import label
import numpy as np
import secrets
import math
from utilities import *
from matplotlib import pyplot as plt

# the data from this 
roCounts          = [[],[],[],[]]
roCounts_zero     = [[],[],[],[]]
roCounts_one      = [[],[],[],[]]
tx_bits_ref       = []
tx_bits_pred      = []
error_rate        = []

roCounts_heater_0 = []
roCounts_heater_1 = []
roCounts_heater_2 = []
roCounts_heater_3 = []

def phantom_heater_measure(usb_port, baud, delay_cycles, tx_delayTime, cooldown_cycles, num_tx_bits, roCounts, tx, tx_bits_ref, tx_bits_pred):
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

    #############################
    ## Long wire Cross Talk
    ############################
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
            tx_data_new += "10"
        else:
            tx_data_new += "01"
    #########################
    
    # repeat for num_rep times
    rawData = []
    # # the data from this run
    # set tx bit
    ser.write(fsm_addr["SET_TX_WIRE_TT_ADDR"])
    txValue = bitstring_to_bytes(tx_data_new)
    
    for i in range(len(txValue)):
        ser.write(bytearray([txValue[i]]))
        time.sleep(0.1)
    print ("Set TX wire as %s"%(tx_data_new))
    
    # start tx
    ser.write(fsm_addr["SET_PHANTOM_START_ADDR"])
    # wait for the RO 
    time.sleep(4)

    # read debug signal
    # data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    # print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))
    # # read RO counts for numTraces
    # fifo_addresses = ["GET_PHAN_FIFO_0_ADDR", "GET_PHAN_FIFO_1_ADDR", 
    #                     "GET_PHAN_FIFO_2_ADDR", "GET_PHAN_FIFO_3_ADDR"]
    # for n in range(num_tx_bits):# numTraces 4, for each counter, we read 10 entries
    #     for j in range(4):
    #         # 4 FIFOs
    #         data = read32bitData(ser, addr=fifo_addresses[j])
    #         roCounts[j].append(data)
    #         time.sleep(0.1)
    # rawData.append(roCounts)
    # # wait for 1 s
    # time.sleep(2)
    # data = read32bitData(ser, addr = "GET_DEBUG0_PHAN_ADDR")
    # print ("debug0", "0x{:08x}".format(data), "FIFO read num = %d"%(data>>24))    
    
    # Debug signal
    time.sleep(8)
    len_tx_bits = int(num_tx_bits/2)

    phan = read32bitData(ser, addr = "GET_PHAN_START")
    print ("Number of transmitted bits \t:", int(phan/2))
    tx_data_format = int(tx_data, 2)
    tmp_str = "{:0" + str(len_tx_bits) + "b}"
    tx_data_format = tmp_str.format(tx_data_format)
    print("Transmitted bits is \t\t:", tx_data_format)
    time.sleep(0.2)

    # Debug signal
    pred = resultreadPredictedData(ser, len_tx_bits, addr = "GET_DEBUG_DATA_1")
    print ("Received bits from Crosstalk is :", pred)
    # print("   ")
    time.sleep(0.1)
    
    # print(roCounts)
    ##############################
    ## tx bits reference
    ##############################
    tmp = []
    for m in range(len(tx_data)):
        tmp.append(int(tx_data[m]))
    
    tx_bits_ref.append(tmp)
    ##############################

    ##############################
    ## tx bits pred
    ##############################
    tmp = []
    for m in range(len(pred)):
        tmp.append(int(pred[m]))
    
    tx_bits_pred.append(tmp)
    ##############################
    
    ##############################
    ## Error Rate
    error_count = 0
    for i in range(len_tx_bits):
        if(pred[i]!=tx_data_format[i]):
            error_count = error_count + 1
    
    error = (error_count/len_tx_bits) * 100
    error_rate.append(error)
    ##############################
    return pred, error

def ro_heater(usb_port, baud, plot_path, ro_sensor_cycles, ro_sensor_cycles_offset, ro_heater_on_num):
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
    
    roCounts_heater_0 = []
    
    ##############################
    ## RO HEATER
    ##############################
 
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

    # # set ro_heater_cycles
    # ser.write(fsm_addr["SET_RO_HEATER_CYCLES"])
    # time.sleep(0.1)
    
     # set ro_heater_on_num
    ser.write(fsm_addr["SET_RO_HEATER_ON_NUM"])
    d = splitBytes(ro_heater_on_num)
    for i in range(4):
        ser.write(bytearray(d[i]))
    time.sleep(0.1)
    print ("ro_heater_on_num = %d "%(ro_heater_on_num))
    
    # start ro heater
    print("SET RO HEATER START")
    ser.write(fsm_addr["SET_RO_HEATER_START"])
    # wait for the ro heater
    time.sleep(4)
    
    # Debug signal
    debug = read32bitData(ser, addr = "GET_DEBUG_DATA_0")
    print ("Turning heater on for bit \t:", debug)
    time.sleep(0.1)
    print("")
    
    # read RO counts for ro sensor_0
    # fifo_address= ["GET_RO_HEATER_FIFO_ADDR_0"]
    # for j in range(1024): ## depth of FIFO
    #     data = read32bitData(ser, addr=fifo_address[0])
    #     roCounts_heater_0.append(data)
    #     time.sleep(0.1)
    # # wait for 2 s
    # time.sleep(2)

    # # read RO counts for ro sensor_1
    # fifo_address= ["GET_RO_HEATER_FIFO_ADDR_1"]
    # for j in range(1024): ## depth of FIFO
    #     data = read32bitData(ser, addr=fifo_address[0])
    #     roCounts_heater_1.append(data)
    #     time.sleep(0.1)
    # # wait for 2 s
    # time.sleep(2)

    # # read RO counts for ro sensor_2
    # fifo_address= ["GET_RO_HEATER_FIFO_ADDR_2"]
    # for j in range(1024): ## depth of FIFO
    #     data = read32bitData(ser, addr=fifo_address[0])
    #     roCounts_heater_2.append(data)
    #     time.sleep(0.1)
    # # wait for 2 s
    # time.sleep(2)

    # # read RO counts for ro sensor_3
    # fifo_address= ["GET_RO_HEATER_FIFO_ADDR_3"]
    # for j in range(1024): ## depth of FIFO
    #     data = read32bitData(ser, addr=fifo_address[0])
    #     roCounts_heater_3.append(data)
    #     time.sleep(0.1)
    # # wait for 2 s
    # time.sleep(2)

    # #######################################
    # Plot RO SENSOR 0 DATA
    # ro_counts_drop_0 = ((np.mean(roCounts_heater_0[975:1024])-np.mean(roCounts_heater_0[425:470]))/np.mean(roCounts_heater_0[975:1024])) *100
    # print("ro counts percent drop is %.2f %%",ro_counts_drop_0)
    # plt.plot(roCounts_heater_0, "r+")
    # plt.xlabel("Measurement Number")
    # plt.ylabel("RO Counts")
    # plt.title('RO COUNTS')
    # # plt.ylim(1900000,2630000)
    # plt.show()
    # plt.savefig(plot_path + "random_bits_ro_heater_sensor_0_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) + timeStamp() + ".png")
    # plt.clf()
    # ########################################

    # #######################################
    # # Plot RO SENSOR 1 DATA
    # # ro_counts_drop_1 = ((np.mean(roCounts_heater_1[975:1024])-np.mean(roCounts_heater_1[425:470]))/np.mean(roCounts_heater_1[975:1024])) *100
    # # print("")
    # # print("ro counts percent drop is %.2f %%",ro_counts_drop_1)
    # plt.plot(roCounts_heater_1, "r+")
    # plt.xlabel("Measurement Number")
    # plt.ylabel("RO Counts")
    # plt.title('RO COUNTS')
    # # plt.ylim(1900000,2630000)
    # plt.show()
    # plt.savefig(plot_path + "random_bits_ro_heater_sensor_1_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) + timeStamp() + ".png")
    # plt.clf()
    # #######################################

    # #######################################
    # # Plot RO SENSOR 2 DATA
    # # ro_counts_drop_2 = ((np.mean(roCounts_heater_2[975:1024])-np.mean(roCounts_heater_2[425:470]))/np.mean(roCounts_heater_2[975:1024])) *100
    # # print("")
    # # print("ro counts percent drop is %.2f %%",ro_counts_drop_2)
    # plt.plot(roCounts_heater_2, "r+")
    # plt.xlabel("Measurement Number")
    # plt.ylabel("RO Counts")
    # plt.title('RO COUNTS')
    # # plt.ylim(1900000,2630000)
    # plt.show()
    # plt.savefig(plot_path + "random_bits_ro_heater_sensor_2_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) + timeStamp() + ".png")
    # plt.clf()
    # #######################################

    # #######################################
    # # Plot RO SENSOR 3 DATA
    # # ro_counts_drop_3 = ((np.mean(roCounts_heater_3[975:1024])-np.mean(roCounts_heater_3[425:470]))/np.mean(roCounts_heater_3[975:1024])) *100
    # # print("")
    # # print("ro counts percent drop is %.2f %%",ro_counts_drop_3)
    # plt.plot(roCounts_heater_3, "r+")
    # plt.xlabel("Measurement Number")
    # plt.ylabel("RO Counts")
    # plt.title('RO COUNTS')
    # # plt.ylim(1900000,2630000)
    # plt.show()
    # plt.savefig(plot_path + "random_bits_ro_heater_sensor_3_counts_sensor_cycles_" + str(ro_sensor_cycles) + "_heater_on_" + str(ro_heater_on_num) + timeStamp() + ".png")
    # plt.clf()
    # #######################################

def plot_error_rate(tx, num_tx_bits, num_measurements, error_rate, error_rate_path):
    #######################################
    ## Error rate
    # print(error_rate)
    # Plot Counters
    if(tx == None):
        txbit = "random"
    else:
        txbit = str(tx)
    x = list(range(0,num_measurements)) # num of measurements
    # print(x)
    print(error_rate)
    plt.plot(x,error_rate, "ro")
    plt.xlabel("Measurement Number")
    plt.ylabel("Error %")
    plt.title('PREDICTED BITS ERROR RATE_' + str(int(num_tx_bits)) + "txbit_" + txbit)
    plt.ylim(-1,100)
    plt.show()
    plt.savefig(error_rate_path + "predicted_bits_" + str(int(num_tx_bits)) + "_txbits_" + txbit + "_measure" + str(num_measurements) + "_cooldown" + str(cooldown_cycles) + "_cycles_per_bit" + str(delay_cycles) + timeStamp() + ".png")
    plt.clf()

def analysis(file,num_measurements,tx,tx_bits_ref,num_tx_bits,cooldown_cycles,delay_cycles):
    tx_bits  =     []
    tx_bits_diff = [[],[],[],[]]
    error_count  = []
    error_pos    = []
    best_offset  = []
    index_offset = []
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
        res =  [abs(ele) for ele in best_offset[i]]
        max_value = max(res) 
        index_offset.append(res.index(max_value))
    
    for i in range(num_tx_bits*num_measurements):
        best_offset_new.append(best_offset[i][index_offset[i]])
        
    # Determining tx bits data
    for i in range(len(best_offset_new)):
        if(best_offset_new[i] < 0):
            tx_bits.append(0)
        else:
            tx_bits.append(1)
    
    tx_bits = list(split(tx_bits,num_measurements))
    tx_bits_ref = list(split(tx_bits_ref,num_measurements))
    error_pos = list(split(error_pos,num_measurements))
    best_offset_new = list(split(best_offset_new,num_measurements))
    index_offset = list(split(index_offset,num_measurements))
    print("")
    print("offset data",best_offset_new)
    print("indexoffset",index_offset)

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
                error_pos[l].append(1) # 1 is error bit
            else:
                error_pos[l].append(0) # 0 is correct bit   

        error_count.append(count*(100/num_tx_bits))
        count = 0

    print("Org",tx_bits)
    print("Ref",tx_bits_ref)
    print("Ect",error_count)
    print("Eps",error_pos)
    print("")
    
    #######################################
    # Plot Counters
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
    x = np.array(range(0,num_tx_bits)) # num of measurements
    tx_array = np.array([num_tx_bits] * num_tx_bits)
    for i in range(len(best_offset_new)):
        for j in range(num_tx_bits):
            if(index_offset[i][j] == 0):
                plt.plot(x[j],index_offset[i][j], "ro")
            
            if(index_offset[i][j] == 1):
                plt.plot(x[j],index_offset[i][j], "go")
            
            if(index_offset[i][j] == 2):
                plt.plot(x[j],index_offset[i][j], "bo")
            
            if(index_offset[i][j] == 3):
                plt.plot(x[j],index_offset[i][j], "ko")
        x += tx_array  
    plt.xlabel("Bit Number")      
    plt.ylabel("Offset Number")
    plt.title('OPTIMAL OFFSET Number')
    plt.show()
    plt.savefig("absolute_offset_random_bits.png")
    plt.clf()
    print(index_offset)
    #######################################

    #######################################
    ## HEAT MAP
    y_ticks = list(range(0,num_tx_bits)) # num of tx bits
    plt.imshow((np.array(error_pos)).T, origin="lower", cmap="YlOrRd", aspect='auto', vmin=0, vmax=1)
    # cbar = plt.colorbar(ticks=[0, 1])
    # cbar.ax.tick_params(labelsize=10)
    # cbar.set_label("Bits")
    plt.xlabel('Measurement Number', weight='bold', fontsize=8)
    plt.ylabel('Bit Number', weight='bold', fontsize=8)
    plt.title('Heatmap for Error Position', weight='bold', fontsize=8)
    plt.yticks(y_ticks)
    plt.grid(False)
    plt.show()
    plt.savefig("heatmaps_" + str(int(num_tx_bits)) + "txbit_" + txbit + "_measure" + str(num_measurements) + "_cooldown" + str(cooldown_cycles) + "_cycles_per_bit" + str(delay_cycles) + ".png")
    plt.clf()
    
    # save txbits reference data to file
    txFileName = "tx_bits_reference_%d_random_%d_bit_cooldown%d_cycles_per_bit%d_%s"%(num_measurements,num_tx_bits,cooldown_cycles, delay_cycles, timeStamp())
    txSaveFile = "%s.npz"%(txFileName)
    print ("Saving to file %s"%(txSaveFile))
    np.savez_compressed(txSaveFile, data=np.asarray(tx_bits_ref))
    saveToFile(tx_bits_ref, "%s.txt"%(txFileName))
    #######################################


if __name__ == "__main__":
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Serial port phantom circuit design tester script.')
    parser.add_argument('-b', '--baud', default='921600', type=str, required=False, help='Baud rate of the serial port.')
    parser.add_argument('-p', '--port', default="/dev/ttyUSB5", type=str, required=False, help='Serial port device name.')
    # parser.add_argument('-j', '--json', default=HOME+'/ccf/ports.json', type=str, required=False, help='Location of the JSON file.')
    parser.add_argument('-d', '--data', default=0xFF, type=int, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('--bit', default=None, type=str, required=False, help='User Input Data to send to FPGA.') 
    parser.add_argument('-r', '--is_random_data', action='store_true', help='Random Input Data to send to FPGA.') 
    parser.add_argument('-t', '--repeat', default=1, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('-n', '--num_measurements', default=4, type=int, required=False, help='Number of times to repeat.') 
    parser.add_argument('--num_tx_bits', default=32, type=int, required=False, help='Number of tx bits.') 
    parser.add_argument('-c', '--cycles', default=1000000, type=int, required=False, help='Cycles per bit.') 
    parser.add_argument('-v', '--threshold_value', default=4884303, type=int, required=False, help='Threshold value') 
    parser.add_argument('--cooldown_cycles', default=8388608, type=int, required=False, help='Cooldown cycles') 
    parser.add_argument('--delay_cycles', default=12582912, type=int, required=False, help='Tx bit Delay cycles') 
    parser.add_argument('--useTXRO', action='store_true')
    args = parser.parse_args()
    
    # read USB port name
    # ports_json_data = getUSBports(args.json)
    # fpgas = list(ports_json_data.keys())
    # usb_port = ports_json_data[fpgas[0]]['uartport']
    # print ("USB port %s"%(usb_port))
    
    usb_port = args.port
    print ("USB port %s"%(usb_port))
   
    num_measurements = args.num_measurements
    num_tx_bits = args.num_tx_bits
    cooldown_cycles= args.cooldown_cycles
    delay_cycles = args.delay_cycles
    tx = args.bit
    ro_sensor_cycles = 2**15
    # ro_sensor_cycles_offset=2**(num_tx_bits-1)
    ro_sensor_cycles_offset = 2**6
    ro_heater_on_num = 5
    data_path ='/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/data/'
    plot_path ='/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/plots/'
    ro_counts_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_counts/data/'
    error_rate_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/error_rates/'
    predicted_bits_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/predicted_bits/'
    transmitted_bits_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/experiments/phantom_ro_heater/transmitted_bits/'

    i = 0
    while i < num_measurements: 
        print("Iteration %d" %(i))
        phantom_heater_measure(usb_port, args.baud, delay_cycles= delay_cycles, tx_delayTime= int((2**24)*10), cooldown_cycles= cooldown_cycles, num_tx_bits= num_tx_bits, roCounts=roCounts, tx=tx,tx_bits_ref=tx_bits_ref, tx_bits_pred=tx_bits_pred)
        time.sleep(3)
        print("")
        # ro_heater(usb_port, args.baud, plot_path=plot_path, ro_sensor_cycles=ro_sensor_cycles, ro_sensor_cycles_offset=ro_sensor_cycles_offset, ro_heater_on_num=ro_heater_on_num)
        i = i + 1
    
    # plot_error_rate(tx, num_tx_bits, num_measurements, error_rate,error_rate_path)
    print(error_rate)
    print("Average error rate is %f",sum(error_rate)/len(error_rate))

    # save predicted bits to file
    predicted_bits_FileName = "predicted_bits_phantum_measure_%d_random_%d_bit_cooldown%d_cycles_per_bit%d_%s"%(num_measurements,num_tx_bits,cooldown_cycles, delay_cycles, timeStamp())
    saveFile = "%s.npz"%(predicted_bits_FileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(predicted_bits_path + saveFile, data=np.asarray(tx_bits_pred))
    # print(tx_bits_pred)
    saveToFile(tx_bits_pred, "%s.txt"%(predicted_bits_path + predicted_bits_FileName))

    # save transmitted bits to file
    transmitted_bits_FileName = "transmitted_bits_phantum_measure_%d_random_%d_bit_cooldown%d_cycles_per_bit%d_%s"%(num_measurements,num_tx_bits,cooldown_cycles, delay_cycles, timeStamp())
    saveFile = "%s.npz"%(transmitted_bits_FileName)
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(transmitted_bits_path + saveFile, data=np.asarray(tx_bits_ref))
    # print(tx_bits_ref)
    saveToFile(tx_bits_ref, "%s.txt"%(transmitted_bits_path + transmitted_bits_FileName))

    # save roCounts data to file
    # dFileName = "data_rep_phantum_measure_%d_random_%d_bit_cooldown%d_cycles_per_bit%d_%s"%(num_measurements,num_tx_bits,cooldown_cycles, delay_cycles, timeStamp())
    # saveFile = "%s.npz"%(dFileName)
    # print ("Saving to file %s"%(saveFile))
    # np.savez_compressed(ro_counts_path + saveFile, data=np.asarray(roCounts))
    # saveToFile(roCounts, "%s.txt"%(ro_counts_path + dFileName))

    # analysis(saveFile,num_measurements,tx,tx_bits_ref,num_tx_bits,cooldown_cycles,delay_cycles)

    # # save roCounts heater data to file       
    # dFileName = "data_rep_ro_heater_sensor_0_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    # saveFile = "%s.npz"%(dFileName)
    # print ("Saving to file %s"%(saveFile))
    # np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_0))
    # saveToFile(roCounts_heater_0, "%s.txt"%(data_path + dFileName))

    # # save roCounts heater data to file       
    # dFileName = "data_rep_ro_heater_sensor_1_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    # saveFile = "%s.npz"%(dFileName)
    # print ("Saving to file %s"%(saveFile))
    # np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_1))
    # saveToFile(roCounts_heater_1, "%s.txt"%(data_path + dFileName))
    
    # # save roCounts heater data to file       
    # dFileName = "data_rep_ro_heater_sensor_2_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    # saveFile = "%s.npz"%(dFileName)
    # print ("Saving to file %s"%(saveFile))
    # np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_2))
    # saveToFile(roCounts_heater_2, "%s.txt"%(data_path + dFileName))
    
    # # save roCounts heater data to file       
    # dFileName = "data_rep_ro_heater_sensor_3_cycles_%d_heater_on_%d_%s"%(ro_sensor_cycles,ro_heater_on_num,timeStamp())
    # saveFile = "%s.npz"%(dFileName)
    # print ("Saving to file %s"%(saveFile))
    # np.savez_compressed(data_path + saveFile, data=np.asarray(roCounts_heater_3))
    # saveToFile(roCounts_heater_3, "%s.txt"%(data_path + dFileName))
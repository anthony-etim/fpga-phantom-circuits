import sensors
import json
import numpy as np
from matplotlib import pyplot as plt
import os
import sys

if __name__ == '__main__':
    data = {"Data": []}
    lm_sensor_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/lm_sensors/'
    json_file = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/lm_sensors/lm_sensors.json'
    Vcore_voltage     = []
    in1_voltage       = []
    AVCC_voltage      = []
    three_V_voltage   = []
    in4_voltage       = []
    in5_voltage       = []
    in6_voltage       = []
    three_VSB_voltage = []
    Vbat_voltage      = []
    cpu_0_vid_voltage = []
    core_10_temp      = []


    with open(json_file, 'r') as f:
        lines = f.readlines()
        for line in lines:
            data["Data"].append(json.loads(line))
            
    ## Combining JSON DATA
    with open(lm_sensor_path + 'lm_sensors_combined.json', 'w') as outfile:
            # json.dump(dictionary, outfile, indent=4)
            json.dump(data, outfile, indent=4)
            # outfile.write('\n')

    ## Loading New JSON Data
    f = open(lm_sensor_path + 'lm_sensors_combined.json',)
    json_obj = json.load(f)
    for i in range(len(json_obj["Data"])):
        tmp = json_obj["Data"][i]
        Vcore_voltage.append(tmp['Vcore'])
        in1_voltage.append(tmp['in1'])
        AVCC_voltage.append(tmp['AVCC'])
        three_V_voltage.append(tmp['+3.3V'])
        in4_voltage.append(tmp['in4'])
        in5_voltage.append(tmp['in5'])
        in6_voltage.append(tmp['in6'])
        three_VSB_voltage.append(tmp['3VSB'])
        Vbat_voltage.append(tmp['Vbat'])
        cpu_0_vid_voltage.append(tmp['cpu0_vid'])
        core_10_temp.append(tmp['Core 2'])
    f.close()

    # print(core_10_temp)
    #######################################################
    ## RAW DATA
    #######################################################
    voltage_len_org = len(three_V_voltage)
    voltage_len = np.arange(voltage_len_org)
    # plt.xlim(0, 10)
    plt.plot(voltage_len, Vcore_voltage,     label='Vcore Voltage')
    plt.plot(voltage_len, in1_voltage,       label='in1 Voltage')
    plt.plot(voltage_len, AVCC_voltage,      label='AVCC Voltage')
    plt.plot(voltage_len, three_V_voltage,   label='+3.3 Voltage')
    plt.plot(voltage_len, in4_voltage,       label='in4 Voltage')
    plt.plot(voltage_len, in5_voltage,       label='in5 Voltage')
    plt.plot(voltage_len, in6_voltage,       label='in6 Voltage')
    plt.plot(voltage_len, three_VSB_voltage, label='3VSB Voltage')
    plt.plot(voltage_len, cpu_0_vid_voltage, label='cpu0_vid Voltage')

    # plt.plot(voltage_len, three_V_voltage, color = 'red', label='3.3 Voltage')
    # plt.plot(voltage_len, in4_voltage, color = 'blue', label='in4 Voltage')
    plt.xlabel("Bit Number",fontsize=14)
    plt.ylabel("Voltage (V)",fontsize=14)
    plt.xticks(fontsize=14)
    plt.yticks(fontsize=12)
    plt.grid()
    # plt.legend(title="Voltage: ", loc="best",fancybox=True, fontsize=14)
    plt.legend(title="Voltage: ", loc="best",fancybox=True)
    plt.savefig(lm_sensor_path + "voltage_data_32_bits_all_voltages_new.pdf")
    # plt.savefig(lm_sensor_path + "voltage_data_32_bits_idle.pdf")
    plt.clf()
    sys.exit()
    #######################################################
   
    #######################################################
    ## FFT
    #######################################################
    voltage_fft = (np.fft.fft(in6_voltage))
    voltage_len_org = len(in6_voltage)
    voltage_len = np.arange(voltage_len_org)
    sr = voltage_len_org # sampling rate is the signal length
    T = voltage_len_org/sr
    freq = voltage_len/T
    plt.grid()
    # plt.stem(freq, np.imag(voltage_fft), 'r', markerfmt=" ", basefmt="-r")
    # plt.xlim(0, 10)
    plt.plot(voltage_len,np.imag(voltage_fft), color = 'red')
    plt.savefig(lm_sensor_path + "voltage_fft.pdf")
    # plt.savefig(lm_sensor_path + "voltage_raw.pdf")
    plt.clf()
    # sys.exit()
    #######################################################
    ## Prediction
    #######################################################
    
    pattern_orig_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/phantom_ro_measurements/fpga/16/parameters.json'
    f = open(pattern_orig_path,)
    json_obj = json.load(f)
    pattern_orig = json_obj["pattern_orig"]
    f.close()
    # print(pattern_orig)
    # sys.exit()
    
    # core_10_temp = core_10_temp[3:]
    # core_10_temp = [core_10_temp[l:l + 10] for l in range(0, len(core_10_temp), 10)]
    # print(len(core_10_temp))
    # sys.exit()
    # core_10_temp = [np.average(x) for x in core_10_temp]
    core_10_diff = []
    predicted_bits = []
    accuracy = []
    for i in range(0, len(core_10_temp), 2):
        # print((core_10_temp[i]))
        diff = core_10_temp[i] - core_10_temp[i+1]
        core_10_diff.append(diff)
    print((core_10_temp))
    # sys.exit()
    
    for i in range(len(core_10_diff)):
        if(core_10_diff[i] <= 0):
            predicted_bits.append(0)
            predicted_bits.append(1)
        if(core_10_diff[i] > 0):
            predicted_bits.append(1)
            predicted_bits.append(0)
    
    print(pattern_orig)
    print("")
    print(predicted_bits)
    # sys.exit()
    count = 0
    for i in range(len(pattern_orig)):
        if(pattern_orig[i] == predicted_bits[i]):
            count = count + 1
        else:
            count = count + 0
    accuracy = count/len(predicted_bits) * 100
    print('Accuracy is %d '%accuracy)
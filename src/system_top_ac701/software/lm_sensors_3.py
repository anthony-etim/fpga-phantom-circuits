import sensors
import json
import time
import datetime

def timeStamp():
    return datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

if __name__ == '__main__':
    dictionary = {}
    lm_sensor_path = '/home/anthony/Documents/fpga-phantom-circuits/src/system_top_ac701/Vivado/plots/lm_sensors/'
    sensors.init()
    while True:
    # for i in range (64):
    # for i in range (1728):   
        try:
            for chip in sensors.iter_detected_chips():
                # print('%s at %s' % (chip, chip.adapter_name))
                for feature in chip:
                    # print('  %s: %.3f' % (feature.label, feature.get_value()))
                    if(feature.label in dictionary):
                        dictionary[feature.label+'_0'] = feature.get_value()
                    else:
                        dictionary[feature.label] = feature.get_value()
                    # print(dictionary)
                # dump current timestamp
            dictionary['Time'] = timeStamp()
        finally:
            sensors.cleanup()
            with open(lm_sensor_path + 'lm_sensors.json', 'a') as outfile:
                # json.dump(dictionary, outfile, indent=4)
                json.dump(dictionary, outfile)
                outfile.write('\n')
        time.sleep(0.1)
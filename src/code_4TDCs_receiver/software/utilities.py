import csv
import sys
import os
import errno
import datetime
import numpy as np

def get_ro_key(n):
    return 'ro_{}'.format(n)

def get_ctrl_key(n):
    return 'ctrl_{}'.format(n)

def saveToFile(data, filename):
    with open (filename, "w") as f:
        for d in data:
            f.write(str(d)+'\n')

def timeStamp():
    return datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")

def int_to_manchester(val, num_bits, msb_to_lsb=True):
    binary = ('{0:0%db}' % num_bits).format(val)
    if len(binary) > num_bits:
        raise ValueError("Cannot represent 0x%0x in %d bits" % (val, num_bits))
    binary = [b for b in binary]
    if not msb_to_lsb:
        binary = binary[::-1]
    vals = []
    for b in binary:
        if b == '1':
            vals += [1, 0]
        elif b == '0':
            vals += [0, 1]
        else:
            raise ValueError("Problem value %s" % b)
    return vals

def makedirs(dirname):
    try:
        os.makedirs(dirname)
    except OSError as exc:  # Python >2.5
        if exc.errno == errno.EEXIST and os.path.isdir(dirname):
            pass
        else:
            raise

class DataParser(object):

    def __init__(self, iterator, config, max_ros=11):
        self.max_ros = max_ros
        self.iterator = iterator
        self.config = dict(config)

    def read(self):
        return self.iterator.read()

    def parse_status(self, val):
        orig_val = val
        status = {}
        is_valid = True

        status['cur_index'] = val & 0xFFFF
        val >>= 16
        status['ctrl_id'] = val & 0x1F
        val >>= 5

        for i in range(11):
            if val & 1 != 1:
                print(status)
                raise ValueError("Invalid input 0x%08x" % orig_val)
            val >>= 1

        status['valid'] = is_valid
        return status

    def get_single_ctrl_counts(self):
        num_ros = self.config['num_ctrl_ros']
        results = self.parse_status(self.read())
        for ro in range(num_ros):
            results[get_ro_key(num_ros-ro-1)] = self.read()
        return results

    def get_heat(self):
        num_heats = self.config['num_heats']
        val = self.read()

        force_heat = self.config.get('force_heat', None)
        if force_heat is not None:
            mask = (1 << num_heats) - 1
            heat_val = force_heat
        else:
            mask = self.config['mask']
            heat_val = None

        orig_mask = mask
        orig_val = val

        for i in range(num_heats):
            cur_heat = val & 1
            val >>= 1
            cur_mask = mask & 1
            mask >>= 1
            if not cur_mask:
                if cur_heat != 0:
                    raise ValueError("Expected 0. Invalid heat 0x%08x" % orig_val)
                continue
            if heat_val is None:
                heat_val = cur_heat
            else:
                if heat_val != cur_heat:
                    raise ValueError("Expected consistency. Invalid heat 0x%08x" % orig_val)

        for i in range(32-num_heats):
            if (val & 1) != 1:
                raise ValueError("Expected 1s. Invalid heat 0x%08x" % orig_val)
            val >>= 1

        if heat_val is None:
            return 0
        else:
            if heat_val == 0:
                return 0
            else:
                return ((1 << num_heats) - 1) & orig_mask

    def get_all_ctrl_counts(self):
        results = {}
        results['heat_enabled'] = self.get_heat()
        num_ctrls = self.config['num_ctrls']
        for ctrl in range(num_ctrls):
            counts = self.get_single_ctrl_counts()
            ctrl_index = num_ctrls-ctrl-1
            ctrl_id = counts['ctrl_id']
            if ctrl_id != ctrl_index:
                print(ctrl, ctrl_index, counts)
                raise ValueError("Invalid ctrl id: %d instead of %d" % (ctrl_index, ctrl_id))
            results[get_ctrl_key(ctrl_index)] = counts
        return results

    def measure(self):
        measurements = dict(self.config)
        num_measurements = measurements['num_measurements']

        num_ctrls = measurements['num_ctrls']
        num_ros = measurements['num_ctrl_ros']

        start_index = None
        prev_heat_in = None

        for rep in range(num_measurements):
            # print("Repetition %d/%d" % (rep, num_measurements))
            cur_counts = self.get_all_ctrl_counts()
            cur_measurements = {
                'heat_enabled': cur_counts['heat_enabled'],
                'mask': measurements['mask'],
            }
            for ctrl in range(num_ctrls):
                # print("Repetition", rep, "Controller", ctrl)
                ctrl_key = get_ctrl_key(ctrl)
                cur_ctrl = cur_counts[ctrl_key]
                cur_index = cur_ctrl['cur_index']
                cur_ctrl_measurements = {}
                if start_index is None:
                    start_index = cur_index
                elif cur_index != (start_index + rep) & 0xFFFF:
                    print(ctrl, start_index, rep, cur_ctrl)
                    raise ValueError('Invalid index: %d instead of %d' % (cur_index, start_index + rep))

                for ro in range(num_ros):
                    ro_key = get_ro_key(ro)
                    cur_ctrl_measurements[ro_key] = cur_ctrl[ro_key]

                cur_measurements[ctrl_key] = cur_ctrl_measurements
            measurements[rep] = cur_measurements

        return measurements

    @staticmethod
    def write_measurements(measurements, mask, outfile, extra_data={}):
        fieldnames = ['rep', 'heat_enabled']
        for k in sorted(extra_data):
            fieldnames.append(k)
        num_ctrls = measurements['num_ctrls']
        num_ros = measurements['num_ctrl_ros']
        for ctrl in range(num_ctrls):
            ctrl_key = get_ctrl_key(ctrl)
            for ro in range(num_ros):
                ro_key = get_ro_key(ro)
                fieldnames.append("%s_%s" % (ctrl_key, ro_key))

        if not outfile:
            csvfile = sys.stdout
        else:
            csvfile = open(outfile, 'w')

        avs = {
        }
        for fieldname in fieldnames:
            if fieldname not in ['rep', 'heat_enabled'] and fieldname not in extra_data:
                avs[fieldname] = {
                    0: [],
                    mask: []
                }

        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for rep in range(measurements['num_measurements']):
            cur_meas = measurements[rep]
            line = {
                'heat_enabled': cur_meas['heat_enabled'],
                'rep': rep
            }
            for k in extra_data.keys():
                line[k] = extra_data[k]
            for ctrl in range(num_ctrls):
                ctrl_key = get_ctrl_key(ctrl)
                for ro in range(num_ros):
                    ro_key = get_ro_key(ro)
                    line["%s_%s" % (ctrl_key, ro_key)] = cur_meas[ctrl_key][ro_key]
                    avs["%s_%s" % (ctrl_key, ro_key)][cur_meas['heat_enabled']] = cur_meas[ctrl_key][ro_key]
            writer.writerow(line)

        for k in sorted(avs):
            v = avs[k]
            m0 = np.mean(v[0])
            m1 = np.mean(v[mask])
            print(k, m0, m1, m0 - m1)

        if outfile:
            csvfile.close()
            
    def write_tdc_measurements(measurements, repetitions, outfile, extra_data={}):
        fieldnames = ['rep', 'tdc_measurement_0','tdc_measurement_1','tdc_measurement_2','tdc_measurement_3']
        for k in sorted(extra_data):
            fieldnames.append(k)

        if not outfile:
            csvfile = sys.stdout
        else:
            csvfile = open(outfile, 'w')

        if(repetitions==1):
            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            writer.writeheader()
        for rep in range(repetitions):
            line = {
                'tdc_measurement_0': measurements[0],
                'tdc_measurement_1': measurements[1],
                'tdc_measurement_2': measurements[2],
                'tdc_measurement_3': measurements[3],
                'rep': rep
            }
            for k in extra_data.keys():
                line[k] = extra_data[k]
                
            writer.writerow(line)

        if outfile:
            csvfile.close()
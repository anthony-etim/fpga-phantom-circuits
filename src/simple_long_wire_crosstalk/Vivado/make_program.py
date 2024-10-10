#!/usr/bin/python3

import os
import sys
import json
import argparse
import re
import subprocess

# Default Vivado tools path
vivado = '/tools/Xilinx/Vivado/2019.1/bin/vivado'

# Try to detect if hw_server is running, if so change Vivado tools path to math tools versions
returned_text = subprocess.check_output("ps -aux | grep hw_server", shell=True, universal_newlines=True)
for line in returned_text.splitlines():
    m = re.match(".*(20[0-9][0-9].[0-9]).*hw_server.*TCP", line)
    if( m != None ):
        version = m.group(1)
        vivado = '/tools/Xilinx/Vivado/' + str(version) + '/bin/vivado'
        break

# Get command line arguments
parser = argparse.ArgumentParser(description='Program the FPGA given build directory with a *.bit file, FPGA board type, and location of the JSON file with FPGA board information.')
parser.add_argument('-d', '--dir', default=None, type=str, required=True, help='Location of the build directory.')
# parser.add_argument('-b', '--board', default=None, type=str, required=True, help='FPGA board type.')
parser.add_argument('-j', '--json', default=None, type=str, required=True, help='Location of the JSON file.')
parser.add_argument('--bitstream', default=None, type=str, required=False, help='Location of the JSON file.')
args = parser.parse_args()

# Get serial number of the programmer
ports_json_file = open(args.json, 'r')
ports_json_data = json.load(ports_json_file)
ports_json_file.close()
board = list(ports_json_data.keys())[0]


# Get the device name needed by the programming tools
with open(os.path.join(str(args.dir), 'device.txt'), 'r') as f:
    device = f.readline().rstrip('\n')


programmer_serial_number = ports_json_data[board]['programmer_serial_number']

# Set the bitstream file path
if (args.bitstream != None):
    bitstream_file = args.bitstream
else:
    bitstream_file = os.path.join(args.dir, 'synth_system.bit')

# Program the device
print('Programming ' + device + ' using bitstream ' + bitstream_file + '...')
command = '' + vivado + ' -nojournal -nolog -mode batch -source program.tcl -tclargs ' + device + ' ' + programmer_serial_number + ' ' + bitstream_file + ' | tee -a ' + args.dir + '/program-report.txt'
os.system(command)

#with open(os.path.join(args.dir, 'program.log'), 'w') as outfile:
#    subprocess.call([vivado, '-nojournal', '-nolog', '-mode', 'batch', '-source', 'program.tcl', '-tclargs', '{}'.format(device), '{}'.format(bitstream_file)], stdout=outfile, stderr=outfile, cwd=os.getcwd())

# Done.
print("Done.")

#!/usr/bin/python3

import sys
import os
import json
from shutil import copyfile
import subprocess

# Set Xilinx path to bin folder with tools
xilinx_tools_path = "/tools/Xilinx/Vivado/2019.1/bin/"
vivado = os.path.join( xilinx_tools_path, 'vivado' )

# Set location of JSON configuration file for baords
cfg_file_name = "../boards.json"

# Get command line arguments, if they are missing then exit
if len(sys.argv) == 2:
    board = sys.argv[1]
else:
    print('Need to specify board to build.')
    sys.exit(1)

print('Building phantom_circuits design for board ' + board + '...')

# Set other parameters
build_dir = '' + '../build/' + board + ''
src = '' + build_dir + '/source.txt'
toplevel = 'phantom_circuits_top'
buildlogfile = '' + build_dir + '/log.log'

# Read JSON configuration file for the board
cfg_file = open(cfg_file_name, 'r')
cfg_data = json.load(cfg_file)
cfg_file.close()

partname            = cfg_data[board]['partname']
device              = cfg_data[board]['device']
xdcfile             = cfg_data[board]['xdcfile']
input_clk_freq_mhz  = cfg_data[board]['input_clk_freq_mhz']

# Make build directory and IP cores directory
print("Setting up build directory...")

command = 'mkdir -p ' + build_dir + '/src/'
os.system(command)

# Save device name in a file, needed by the programming scripts
device_name_file = open('' + build_dir + '/device.txt', "w")
device_name_file.write(device)
device_name_file.close()

# Save board name in a file, needed by the programming scripts
device_name_file = open('' + build_dir + '/board.txt', "w")
device_name_file.write(board)
device_name_file.close()

# Copy source files
src_list_file = open( src, 'w')
for line in open('source.txt', 'r'):
    src_file = line.rstrip()
    dst_file = os.path.basename(line).rstrip()
    dst_file_with_path = os.path.join( build_dir, 'src', dst_file )
    copyfile( src_file,  dst_file_with_path )
    src_list_file.write('' + build_dir + '/src/' + dst_file + '\n')
src_list_file.close()

# Patch parameters.sv with correct number of leak copies
# lines = open(build_dir + '/src/phantom_circuits_top.sv').read().splitlines()
# lines[4] =   '    parameter CLK_SPEED     = ' + str(int(input_clk_freq_mhz)*1000000) + ','
# open(build_dir + '/src/phantom_circuits_top.sv', 'w').write('\n'.join(lines))
cmd = "sed -ie 's/parameter CLK_SPEED     = 300_000_000,/parameter CLK_SPEED     = %d,/g' %s"%(int(input_clk_freq_mhz)*1000000, build_dir + '/src/phantom_circuits_top.sv')
p = subprocess.call([cmd], shell=True)



# Build actual design
print("Building actual design...")

# ipDir = '../ip/%s'%(partname)
command = '' + vivado + ' -nojournal -log ' + buildlogfile + ' -mode batch -source synthesize.tcl -tclargs ' + src + ' ' + toplevel + ' ' + partname + ' ' + xdcfile + ' ' + board + ' | tee -a ' + build_dir + '/synth-report.txt'
os.system(command)

# Done.
print("Done.")

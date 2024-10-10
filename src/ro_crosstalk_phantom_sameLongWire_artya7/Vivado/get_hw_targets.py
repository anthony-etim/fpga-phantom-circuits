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

# Call Vivado to get list of hardware targets 
print('Calling Vivado to get list of hardware targets...')
command = '' + vivado + ' -nojournal -nolog -mode batch -source get_hw_targets.tcl'
os.system(command)

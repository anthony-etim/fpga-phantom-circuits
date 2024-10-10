# /*
#  *  
#  * Copyright (C) 2021
#  * Author: Shanquan Tian <shanquan.tian@yale.edu>
#  *          
#  * This program is free software; you can redistribute it and/or modify
#  * it under the terms of the GNU General Public License as published by
#  * the Free Software Foundation; either version 3 of the License, or
#  * (at your option) any later version.
#  *
#  * This program is distributed in the hope that it will be useful,
#  * but WITHOUT ANY WARRANTY; without even the implied warranty of
#  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  * GNU General Public License for more details.
#  *
#  * You should have received a copy of the GNU General Public License
#  * along with this program; if not, write to the Free Software Foundation,
#  * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
#  *
# */

###########
# This script is used to generate XDC constrant files.
###########

import argparse
import json
import re

# function to read XDC lib file
def read_xdc_lib(file):
    lines=[]
    with open(file, "r") as f:
        lines = f.readlines()
    return lines

# function to write final XDC file
def writeXDC(constraints, fileName):
    print ("Write to XDC file %s"%(fileName))
    with open(fileName, "w") as f:
        for l in constraints:
            f.write(l)

# tdc_inst_hier: instant hierarchy
# tdc_loc: the bottom left point of the TDC location
def tdc_xdc (tdc_inst_hier, tdc_loc, pblock_name, tdc_id = 0, tdc_xdc_lib="./ac701/tdc_carry4_X12Y150.xdc" ):
    # hard code in the lib xdc file:
    #   PBLOCKNAMEFIXME: pblock name
    #   INSTFIXME: inst hierarchy
    #   12, 150: the bottom left point
    x_offset = tdc_loc[0] - 12
    y_offset = tdc_loc[1] - 150
    xdc_constraints = []
    with open(tdc_xdc_lib, "r") as f:
        l = f.readline()
        while (l != ''):
            # the whole area , only once
            if ('resize_pblock' in l):
                orig_loc = re.sub(r'\D+', ' ', l).split()
                x0 = int(orig_loc[0])
                y0 = int(orig_loc[1])
                x1 = int(orig_loc[2])
                y1 = int(orig_loc[3])
                l = re.sub(r'\d+', '%d', l)%(x0+x_offset, y0+y_offset, x1+x_offset, y1+y_offset)
            elif ('set_property LOC SLICE_X' in l):
                x0 = int(re.sub(r'\D+', ' ', l).split()[0])
                y0 = int(re.sub(r'\D+', ' ', l).split()[1])
                l = re.sub(r'\d+', '%d', l, 2)%(x0+x_offset, y0+y_offset)

            if ('PBLOCKNAMEFIXME' in l):
                l = l.replace('PBLOCKNAMEFIXME', pblock_name)

            if ('INSTFIXME' in l):
                l = l.replace('INSTFIXME', tdc_inst_hier)

            # update counter _i_1 
            if (tdc_id > 0 and len(re.findall(r"counter\[\d]_i_1", l)) > 0):
                l = l.replace ('_i_1', '_i_1__%d'%(tdc_id-1))

            # store
            xdc_constraints.append(l)
            # read a new line
            l = f.readline()
    return xdc_constraints

# for AC701 board
# xdcfile: final xdc file
def gen_ac701(xdcfile, n = 1, places = [[12, 150]]):
    # the constraints of tdc-0
    constraints = read_xdc_lib("./ac701/clock.xdc")
    # Add the constraints for RO heater
    constraints = constraints + read_xdc_lib("./ac701/ro_heater.xdc")

    # The constraints for 4 TDcs
    for i in range (n):
        constraints = constraints + tdc_xdc ("GEN_TDC[%d].tdc_inst" % i, places[i], "pblock_tdc_%d" % i, tdc_id=i)
        # tdc_0_constraints = tdc_xdc("GEN_TDC[0].tdc_inst", [12, 150], "pblock_tdc_0")

    # write to final file
    print ("Final XDC file written to %s"%(xdcfile))
    writeXDC(constraints, xdcfile)


# main function
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Generate XDC.')
    parser.add_argument('-b', '--board', default='ac701', type=str, required=False, help='Board.')
    parser.add_argument('-n', '--numTDC', default='1', type=int, required=False, help='Number TDCs')
    args = parser.parse_args()

    # Set location of JSON configuration file for baords
    cfg_file_name = "../boards.json"
    # Read JSON configuration file for the board
    cfg_file = open(cfg_file_name, 'r')
    cfg_data = json.load(cfg_file)
    cfg_file.close()
    partname            = cfg_data[args.board]['partname']
    device              = cfg_data[args.board]['device']
    xdcfile             = cfg_data[args.board]['xdcfile']
    input_clk_freq_mhz  = cfg_data[args.board]['input_clk_freq_mhz']

    places = [
        [135, 10],
        [20, 190],
        [20, 10],
        [135, 190],
    ]

    if (args.board == 'ac701'):
        gen_ac701(xdcfile, n = args.numTDC, places = places)
        # gen_ac701("testGen.xdc")
    else:
        print ("%s NOT defined!"%(args.board))

    
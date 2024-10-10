#
# Copyright (C) 2022
# Author: Shanquan Tian <shanquan.tian@yale.edu>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
#

import sys
import datetime
import time
import argparse
import re
import matplotlib
import matplotlib.pylab as pylab
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import numpy as np
from mpl_toolkits.axes_grid1 import host_subplot
import mpl_toolkits.axisartist as AA

COLORS = [u'#1f77b4', u'#9467bd', u'#ff7f0e', u'#d62728', u'#2ca02c',  u'#8c564b', u'#7f7f7f', u'#17becf',u'#bcbd22', u'#e377c2', u'#5894BB', u'#6F1B0C']


def convert_txt_npz(file):
    NUM = 100
    NUMFIFO = 4
    NUMREADS = 22
    data = np.zeros(shape=[NUM, NUMFIFO, NUMREADS])
    # print (data, data.shape, type(data))
    with open(file, "r") as f:
        for i in range(NUM):
            l = f.readline()
            l = re.sub(r'\[', ' ', l)
            l = re.sub(r'\]', ' ', l)
            l = re.sub(r',', ' ', l)
            l =l.split()
            d_l = np.asarray(l).reshape((NUMFIFO, NUMREADS))
            data[i] = d_l
    # print (data, data.shape, type(data))
    saveFile = file.split('.txt')[0]+'.npz'
    print ("Saving to file %s"%(saveFile))
    np.savez_compressed(saveFile, data=data)
    # load test
    loaddata = np.load(saveFile)['data']
    # print (loaddata, loaddata.shape, type(loaddata))
    # print (loaddata == data)

def plot(data, text):
    # generate x 
    x = np.zeros(shape=data.shape)
    x[0] = np.arange(1, data.shape[1]+1)
    for i in range(1,4):
        # x[i] = x[i-1]+0.25
        x[i] = x[i-1]
    # print (x, x.shape, type(x))
    # sys.exit(0)
    FIGSIZE=(3.3,2.5)
    fig = plt.figure(figsize=FIGSIZE)
    ax = fig.add_subplot(111)
    ax.plot(x[0], data[0],  markersize=4, marker='^', label=r'Counter-0')
    ax.plot(x[1], data[1],  markersize=4, marker='>', label=r'Counter-1')
    ax.plot(x[2], data[2],  markersize=4, marker='o', label=r'Counter-2')
    ax.plot(x[3], data[3],  markersize=4, marker='*', label=r'Counter-3')


    ax.set_xlabel(r'Measurements',fontsize=8, labelpad=1)
    ax.set_ylabel(r'RO Counts',fontsize=8, labelpad=1)
    ax.legend(loc='best',frameon=True, fontsize=7, numpoints=1, labelspacing=0.1)
    # plt.ylim ([-1000, 800])
    plt.savefig("tmp_figure_%s.pdf"%(text), dpi=300, bbox_inches='tight')
    plt.show()


def plot_twoAxes(data, data_raw, text):
    # generate x 
    x = np.zeros(shape=data.shape)
    x[0] = np.arange(1, data.shape[1]+1)
    for i in range(1,4):
        # x[i] = x[i-1]+0.25
        x[i] = x[i-1]
    # print (x, x.shape, type(x))
    # sys.exit(0)
    FIGSIZE=(3.3,3)
    fig = plt.figure(figsize=FIGSIZE)
    host = host_subplot(111, axes_class=AA.Axes)
    par1 = host.twinx()

    host.set_xlabel(r'Measurements',fontsize=8, labelpad=1)
    host.set_ylabel("RO Counts Subtraction",fontsize=8, labelpad=1)
    par1.set_ylabel("RO Counts")
    par1.axis["right"].toggle(all=True)

    host.set_ylim(-3000, 1500)
    par1.set_ylim(min(data_raw[0])-1000, max(data_raw[0])+8000)

    p_0, = host.plot(x[0], data[0],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[0], marker='^', label=r'Counter-0 Subtraction')
    p_1, = host.plot(x[1], data[1],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[0], marker='>', label=r'Counter-1 Subtraction')
    p_2, = host.plot(x[2], data[2],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[0], marker='o', label=r'Counter-2 Subtraction')
    p_3, = host.plot(x[3], data[3],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[0], marker='*', label=r'Counter-3 Subtraction')


    p_0_raw = par1.plot(x[0], data_raw[0],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[1], marker='^', label=r'Counter-0 Readout')
    p_1_raw = par1.plot(x[1], data_raw[1],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[1], marker='>', label=r'Counter-1 Readout')
    p_2_raw = par1.plot(x[2], data_raw[2],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[1], marker='o', label=r'Counter-2 Readout')
    p_3_raw = par1.plot(x[3], data_raw[3],  markersize=5, linestyle = 'dashed', linewidth = 0.7, color=COLORS[1], marker='*', label=r'Counter-3 Readout')




    host.legend(frameon=True, fontsize=7, numpoints=1, labelspacing=0.1, bbox_to_anchor=(1.3, 0.5), loc='upper left', borderaxespad=0)

    host.axis["left"].label.set_color(host.get_lines()[0].get_color())
    par1.axis["right"].label.set_color(par1.get_lines()[0].get_color())

    plt.savefig("%s.pdf"%(text), dpi=300, bbox_inches='tight')
    plt.show()

def subst_movingAve(l):
    MOVING_NUM = 5
    movingAve = 0.0
    res = np.zeros(shape=[l.shape[0]-MOVING_NUM])
    for i in range(MOVING_NUM):
        movingAve = movingAve + l[i]
    movingAve = movingAve / MOVING_NUM

    for i in range(MOVING_NUM, l.shape[0]):
        # print (movingAve)
        res[i-MOVING_NUM] = l[i] - movingAve
        movingAve = movingAve - l[i-MOVING_NUM]/MOVING_NUM + l[i]/MOVING_NUM
    # print (res)
    return res


def analysis(file, switch = 1):
    data = np.load(file)['data']
    useMovingAve = False
    if (switch == 0):
        for data_num in [1,2,5]:
            # only use part of the repetition
            d = data[0:data_num]
            print (d.shape)
            # print (data, data.shape, type(data))
            aveData = d.mean(axis=(0))
            # remove the last two numbers which are feedbeef etc.
            aveData = aveData[:, :-2]
            if useMovingAve:
                # apply moving average
                aveData = np.apply_along_axis(subst_movingAve, 1, aveData)
            else:
                # substraction
                aveData = aveData[:, 1:,] - aveData[:, :-1]
            print (aveData, aveData.shape, type(aveData))
            # ave
            plot(aveData, text='%drep_%s'%(data_num, file[:-4]))
    elif (switch == 1):
        ## single run
        # remove the last two numbers which are feedbeef etc.
        for i in range(1):
            d = data[i][:, :-2]
            # substraction
            d_raw = d[:, 1:,]
            d_sub = d[:, 1:,] - d[:, :-1]

            plot_twoAxes(d_sub,d_raw,  text="%s_onerun"%(file[:-4]))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--file', default='data file')
    args = parser.parse_args()


    # convert_txt_npz(args.file)
    analysis(args.file)

    # # test
    # l = np.array([[3,7,8,1,2,6,7,9,5], [1,2,3,4,5,6,7,8,9]])
    # l = np.apply_along_axis(subst_movingAve, 1, l)
    # print ( l , type(l))
    


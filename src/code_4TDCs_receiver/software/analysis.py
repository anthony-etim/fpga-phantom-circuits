#!/usr/bin/python3.8

import time
import datetime
import argparse
import numpy as np
import glob


def read_npzfile(file):
    npzfile = np.load(file)
    rawdata = npzfile['data']
    # print ("raw data", rawdata)
    data = rawdata[:,:-2]
    # print ("data", data)
    ave = np.mean(data, axis=1)
    # print ("Average of 4 TDCs:  ", ave)
    return ave


def read_allnpz(folder):
    files = glob.glob("%s/*.npz"%(folder))
    files.sort()
    for f in files:
        if ('_RF1000MHz' not in f):
            extra = "\t"
        else:
            extra = ""
        ave = read_npzfile(f)
        print ("File: %s  %s\taverage : %s \t diff : %s"%(f, extra,  str(ave), str(np.diff(ave))))


if __name__ == '__main__':
    # Get command line arguments
    parser = argparse.ArgumentParser(description='Analysis script.')
    parser.add_argument('-f', '--file', type=str, required=True, help='Data file.')
    args = parser.parse_args()

    # read_npzfile(args.file)
    read_allnpz(args.file)


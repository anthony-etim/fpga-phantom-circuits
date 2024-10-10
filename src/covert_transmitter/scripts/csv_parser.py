from __future__ import print_function, division

import argparse

import csv
import json
import os
import re
import sys
import math
import numpy as np
import traceback

from six import iteritems

from utilities import makedirs

def atoi(text):
    return int(text) if text.isdigit() else text

def natural_keys(text):
    return [ atoi(c) for c in re.split(r'(\d+)', text) ]


def parse_file(infile):
    basic_cols = set(['rep', 'heat_enabled', 'transmitter_bit', 'transmitter_mask'])
    ro_cols = []

    f = open(infile)
    reader = csv.DictReader(f)

    for field in sorted(reader.fieldnames):
        if field not in basic_cols:
            ro_cols.append(field)

    transmitter_bit = None
    transmitter_mask = None
    vals = {}

    prev_0s = None
    for ro_col in ro_cols:
        vals[ro_col] = {}
        vals[ro_col]['diffs'] = []

    for row in reader:
        row = {k: int(v, 0) for k,v in iteritems(row)}
        if transmitter_bit is None:
            transmitter_bit = row['transmitter_bit']
            transmitter_mask = row['transmitter_mask']
        else:
            if transmitter_bit != row['transmitter_bit']:
                raise ValueError("Inconsistent transmitter bit")
            if transmitter_mask != row['transmitter_mask']:
                raise ValueError("Inconsistent transmitter mask")
        heat = row['heat_enabled']
        for ro_col in ro_cols:
            if heat not in vals[ro_col]:
                vals[ro_col][heat] = []

        for ro_col in ro_cols:
            vals[ro_col][heat].append(row[ro_col])

        if heat == 0:
            prev_0s = {}
            for ro_col in ro_cols:
                prev_0s[ro_col] = row[ro_col]
        elif prev_0s is not None:
            for ro_col in ro_cols:
                vals[ro_col]['diffs'].append(prev_0s[ro_col] - row[ro_col])


    ans = {
        'bit': transmitter_bit,
        'mask': transmitter_mask,
        'vals': vals,
    }

    return ans

def get_stats(vals):
    stats = {}
    for ro, ro_vals in iteritems(vals):
        stats[ro] = {}
        for k, v in iteritems(ro_vals):
            cur_stats = {
                'num': len(v),
                'mean': np.mean(v) if v else 0,
                'std': np.std(v) if v else 0
            }
            stats[ro][k] = cur_stats

    return stats

def get_exp_params(base_dir):
    with open(base_dir + 'parameters.json') as f:
        return json.load(f)

def include_ro(k, mask):
    ctrl = int(k.split("_")[1])
    return mask & (1 << ctrl)

def compare_ros(s0, s1, mask, key='diffs'):
    b0 = s0['bit']
    b1 = s1['bit']
    if (b0, b1) not in [(0, 1), (1, 0)]:
        raise ValueError("Invalid pattern %d, %d" % (b0, b1))
    exp_bit = b0
    d0 = s0['means'][key]
    d1 = s1['means'][key]
    std0 = s0['stds'][key]
    std1 = s1['stds'][key]
    neg_sum = 0
    tot = 0
    neg = 0
    skipped = 0
    for k in sorted(d0):
        m0 = d0[k]
        m1 = d1[k]
        diff = m1 - m0
        stddiff = std1[k] - std0[k]
        cv1 = std1[k]/m1
        cv0 = std0[k]/m0
        use =  diff
        # use = stddiff
        # use = cv1 - cv0
        # if not include_ro(k, mask):
        #     skipped += 1
        #     continue
        # if tot == 0:
        #     print(exp_bit, "%10.2e" % cv1, "%10.2e" % cv0, "%10.2e" % (cv1-cv0))
        # if min(m0, m1) <= 100:
        #     skipped += 1
        #     continue
        # if abs(diff) < 0.1:
        #     # print("0 Diff for", m0, m1)
        #     skipped += 1
        #     continue
        # else:
        #     print(m0, m1)
        neg_sum += use
        tot += 1
        if use < 0:
            neg += 1
    return (exp_bit, neg, tot, neg_sum, skipped)


def get_keys(all_stats):
    return all_stats[list(all_stats.keys())[0]]['means'].keys()

def get_success_rate(all_stats, exp_params, key='diffs', flip=False):
    repetitions = exp_params['repetitions']
    pattern = exp_params['pattern']
    mask = exp_params['mask']

    total = 0
    correct = 0
    skipped = 0
    errs = []
    actual_correct = 0

    for i in range(len(pattern)//2):
        total_correct = 0
        for a0 in range(repetitions):
            s0 = all_stats["%d_%d" % (2*i, a0)]
            for a1 in range(repetitions):
                s1 = all_stats["%d_%d" % (2*i+1, a1)]
                exp_bit, neg, tot, neg_sum, skip = compare_ros(s0, s1, mask, key)
                # print(key, exp_bit, neg, tot
                is_correct = False
                if exp_bit == (1 if not flip else 0):
                    if neg > tot/2 or (neg == tot/2 and neg_sum < 0):
                        is_correct = True
                elif exp_bit == (0 if not flip else 1):
                    if neg < tot/2 or (neg == tot/2 and neg_sum > 0):
                        is_correct = True
                if is_correct:
                    correct += 1
                    total_correct += 1
                else:
                    errs.append((i, a0, a1))
                if tot > 0:
                    total += 1
                skipped += skip

        if total_correct > (repetitions*repetitions)/2:
            actual_correct += 1

    return (correct, total, pattern, errs, skipped)


def get_all_stats(base_dir):
    all_stats = {}
    for f in os.listdir(base_dir):
        split = os.path.splitext(f)
        if split[1] != '.csv':
            continue
        ans = parse_file(base_dir + f)
        stats = get_stats(ans['vals'])
        ans['full_stats'] = stats
        means = {}
        stds = {}
        for k, v in iteritems(stats):
            for k2 in v:
                if k2 not in means:
                    means[k2] = {}
                    stds[k2] = {}
                means[k2][k] = v[k2]['mean']
                stds[k2][k] = v[k2]['std']
        ans['means'] = means
        ans['stds'] = stds
        all_stats[split[0]] = ans
    return all_stats

def fully_parse_stats(all_stats, exp_name):
    sp = exp_name.split("-")
    row = {
        'trig_bit': sp[1],
        'mask': sp[3],
        'volt': sp[5],
    }

    num = 0

    vals = {}
    for k in all_stats['0_0']['full_stats'].keys():
        v1 = {}
        for k1 in ['on', 'off', 'diff']:
            v2 = {}
            for k2 in ['var', 'num', 'total']:
                v2[k2] = 0
            v1[k1] = v2
        vals[k] = v1

    for k, v in iteritems(all_stats):
        if not k.startswith('0_'):
            raise ValueError("Expected %s to start with 0_" % k)
        if v['bit'] != 0:
            raise ValueError("Expected bit to be 0")
        for k2, v2 in iteritems(v['full_stats']):

            for k3, v3 in iteritems(v2):
                if k3 == 0:
                    k3 = 'off'
                elif k3 == 'diffs':
                    k3 = 'diff'
                elif k3 == int(sp[3]):
                    k3 = 'on'
                else:
                    raise ValueError("Unexpected key %s" % str(k3))
                cur_vals = vals[k2][k3]
                cur_vals['num'] += v3['num']
                cur_vals['total'] += v3['num']*v3['mean']
                cur_vals['var'] += v3['std']*v3['std']

    nums = {
        'on': 0,
        'off': 0,
        'diff': 0,
    }

    for k1, v1 in iteritems(vals):
        for k2, v2 in iteritems(v1):
            base = '%s_%s_' % (k2, k1)
            row[base + 'mean'] = v2['total']/v2['num']
            row[base + 'std'] = math.sqrt(v2['var'])
            row['%s_num' % k2] = v2['num']
            if nums[k2] == 0:
                nums[k2] = v2['num']
            elif nums[k2] != v2['num']:
                raise ValueError("Inconsistent nums %d, %d" % (nums[k2], v2['num']))

    return row

def parse_all_experiments(basedir, key='diffs', regex='.*', flip=False):
    stats = []
    full_rows = []
    err_dirs = set()
    for exp in sorted(os.listdir(basedir)):
        expdir = basedir + exp + '/'
        if not os.path.isdir(expdir):
            continue
        for name in sorted(os.listdir(expdir),key=natural_keys):
            fulldir = expdir + name + '/'
            print(fulldir)
            if not regex.match(fulldir):
                print("Skipping %s due to regex" % fulldir)
                continue

            all_stats = get_all_stats(fulldir)
            exp_params = get_exp_params(fulldir)

            if 'pattern' in exp:
                name = ''.join([str(x) for x in exp_params['pattern']])

            if key == 'all':
                all_keys = get_keys(all_stats)
            else:
                all_keys = [key]

            if 'voltage' in exp:
                row = fully_parse_stats(all_stats, name)
                full_rows.append(row)

            for k in all_keys:
                try:
                    correct, total, pattern, errs, skipped = get_success_rate(all_stats, exp_params, k, flip)
                except Exception as e:
                    print(fulldir, traceback.format_exc())
                    err_dirs.add(fulldir)
                    continue
                if total == 0:
                    continue
                cur_stat = {
                    'experiment': exp,
                    'name': name,
                    'correct': correct,
                    'total': total,
                    'pattern': ''.join([str(s) for s in pattern]),
                    'key': k,
                    'percentage': float(100*correct)/total if total else 0
                }
                if skipped > 0:
                    err_dirs.add(fulldir)
                print(fulldir, k, "%(correct)d/%(total)d (%(percentage).2f%%)" % cur_stat)
                stats.append(cur_stat)
    return stats, err_dirs, full_rows

def write_all_stats(stats, outfile):
    fieldnames = ['experiment',  'name', 'pattern', 'key', 'correct', 'total', 'percentage']
    if outfile:
        f = open(outfile, 'w')
    else:
        f = sys.stdout
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    for row in stats:
        writer.writerow(row)

    if outfile:
        f.close()


def write_full_rows(stats, outfile):
    if not stats:
        return

    fieldnames = ['board', 'trig_bit', 'mask', 'volt']
    for k in sorted(stats[0].keys()):
        if k not in ['board', 'trig_bit', 'mask', 'volt']:
            fieldnames.append(k)
    if outfile:
        f = open(outfile, 'w')
    else:
        f = sys.stdout
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    writer.writeheader()
    for row in stats:
        writer.writerow(row)

    if outfile:
        f.close()

def write_err_dirs(err_dirs, outfile):
    if outfile:
        f = open(outfile, 'w')
    else:
        f = sys.stderr

    f.write("These directories contain ROs which are stuck.\n")

    for err_dir in sorted(err_dirs):
        f.write("%s\n" % err_dir)

    if outfile:
        f.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Parse CSV measurements.')
    parser.add_argument("-m", "--measdir", default=None, help='Measurement directory')
    parser.add_argument("-r", "--resdir", default=None, help='Results directory')
    parser.add_argument("-f", "--filter", default='.*', help='Regex filter')
    parser.add_argument("-k", "--key", default='all', help='key')
    parser.add_argument("-F", "--flip", action='store_true', help='flip direction')
    parser.add_argument("-o", "--outfile", default='stats', help='outname')
    parser.add_argument("-l", "--log", action="store_true", help="Write error log")

    args = parser.parse_args()

    regex = re.compile(args.filter)

    if args.measdir:
        expdir = args.measdir + '/'
    else:
        expdir = os.path.dirname(os.path.abspath(__file__)) + '/measurements/'

    if args.resdir:
        resdir = args.resdir + '/'
    else:
        resdir = os.path.dirname(os.path.abspath(expdir)) + '/results/'

    makedirs(resdir)
    stats, err_dirs, full_rows = parse_all_experiments(expdir, key=args.key, regex=regex, flip=args.flip)
    write_all_stats(stats, resdir + args.outfile + '.csv')
    if args.log:
        write_err_dirs(err_dirs, resdir + args.outfile + '.errs.log')
    write_full_rows(full_rows, resdir + args.outfile + '_full.csv')

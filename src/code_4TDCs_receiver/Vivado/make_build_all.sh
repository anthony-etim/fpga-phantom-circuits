#!/bin/bash

boards="ac701 kc705 kcu1500 u50 vcu118"

echo 'Started parallel build...'
echo''

date

parallel --verbose --jobs 3 './make_build_one.py  > /dev/null' ::: $boards

date

echo''
echo 'Check build directories for output.'

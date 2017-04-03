#!/bin/bash

# Simple bash script to record broadband speed
# Use with crontab to run periodically
# e.g 
#         */30 * * * * /path/to/script/speed_test.sh


url='http://speedtest.london.linode.com/100MB-london.bin'
temp_file=$(mktemp)
result_file='/home/lapthorn/result1'

wget -O /dev/null ${url}  2>${temp_file}
cat ${temp_file} |awk '/MB\/s/ {print $1" "$2" "$3$4}' >>${result_file}



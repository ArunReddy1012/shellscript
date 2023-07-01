#!/bin/bash

path=/home/centos

date=$(date +%F)
log_file=$date.log

input=$(find /home/centos -name "*.log" -type -f -mtime +14)

while IFS= read line;
do 
    echo "deleting log file $line" &>> $log_file
    em -rf $line
done <<< "$input"
#!/bin/bash
#Author - Ritesh Gaihre
#Date - Fri 6 Feb
#Script - This script tells about the node health of system
#Version - 1.2.0

set -x #debug mode
set -e #exit when where is an error
set -o pipefail 

nproc
df -h
free -h
ps -ef 
ps -ef | grep "amazon" | awk -F " " '{print $2}'

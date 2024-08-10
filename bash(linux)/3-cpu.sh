#!/bin/bash
echo "Current CPU load utilization in 1min 5min 15 min is"
uptime | awk '{print $8 $9 $10 $11 $12}'


cpu_utilization=$(top -b -n 1 | grep "%Cpu" | awk '{print $2 + $4}' | cut -d. -f1)
echo "Current Cpu utilization is $cpu_utilization%"

memory_utilization=$(free | grep "Mem" | awk '{print $3/$2*100}')
echo "memory utilization is $memory_utilization%"

disk_utilization=$(df / | grep / |awk '{print $5}')
echo "disk utilization is $disk_utilization"

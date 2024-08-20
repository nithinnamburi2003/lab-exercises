#!/bin/bash
read -p "Enter the process name: " Pname
echo "loading $Pname"

if [ $( ps aux | grep "$Pname" | wc -l ) -eq 0 ]; then
        echo "The process is not running"
else
        ps aux | grep $Pname | awk '{print "PID: "$2", Memory Usage: "$6" "}'
fi

#!/bin/bash

#define a threshold
threshold=80

#find ram usage and store it to a variable
memusage=$( free -m | grep 'Mem:' | awk '{print $3/$2*100}')

#if statement
if [ $memusage -gt $threshold ]; then
        echo "memoru usage is beyond $threshold; Current memory usage is $memusage"
else
        echo "Memory Usage is:$memusage"
fi

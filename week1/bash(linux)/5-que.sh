#!/bin/Bash

read -p "Enter the directory path"  path

read -p "enter the file name" filename

memory=$(du -sh $path | awk '{print $1}')
limit=10000
if [ $memory -gt $limit ]; then
        echo "file size is greater than limit"
        tar -cvzf $filename.tar.gz $filename
        rm $filename
        echo "file is empty" > $filename
else
        echo "file size is within memory"
fi

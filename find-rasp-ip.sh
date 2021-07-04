#!/bin/bash
endpoint=2
while(true)
do
    if [ $endpoint != 94 ]
    then
        echo "try $endpoint" 
        ssh pi@10.42.0.$endpoint
        flag=$?
        if [ $flag -ne 0 ]
        then
            endpoint=`expr $endpoint + 1`
        fi
    fi
done

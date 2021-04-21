#!/bin/bash
endpoint=101
while(true)
do
    ssh ubuntu@192.168.2.$endpoint
    flag=$?
    if [ $flag -ne 0 ]
    then
        endpoint=`expr $endpoint + 1`
    fi
done

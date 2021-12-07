#!/bin/bash

name=$1
length=$2

echo $name
echo $length
if test $length = ""; then
    echo 'yes'
fi

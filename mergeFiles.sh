#!/bin/bash

TOTALDIR='../total.md'
if test -e $TOTALDIR
then
    mv $TOTALDIR $TOTALDIR.back
    touch $TOTALDIR
fi

for name in $(ls -r ./)
do
    if test $name != $(basename "$0")
    then
        echo '#' $(rev <<< $name | cut -d. -f2- | rev) >>  $TOTALDIR # get filename and add into the file as title
        cat $name >> $TOTALDIR
        echo >> $TOTALDIR
        echo >> $TOTALDIR 
        echo >> $TOTALDIR
    fi
done

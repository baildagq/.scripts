#!/bin/bash

flag=1
while [ $flag -ne 0 ]
do
    sudo pacman -S joplin-desktop-electron --noconfirm
    flag=$?
done

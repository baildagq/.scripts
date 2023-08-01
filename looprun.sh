#!/bin/bash

flag=1
while [ $flag -ne 0 ]
do
    # sudo pacman -S joplin-desktop-electron --noconfirm
    # pacman -S telegram-desktop cuda-tools --noconfirm
    # yay -Syyu --noconfirm
    # ssh 136 && sleep 10
    sudo pacman -Syyu --noconfirm
    flag=$?
done

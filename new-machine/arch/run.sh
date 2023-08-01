#!/bin/bash

# pacman package
awk '{print $1}' ./pacman.txt | xargs sudo pacman -S --noconfirm

# yay package
awk '{print $1}' ./yay.txt | xargs yay -S --noconfirm

#!/bin/bash

OS=$(cat /etc/issue | cut -f 1 -d ' ')
case $OS in
    'Arch')
        INSTALL() { sudo pacman -S --needed $@; }
        UPDATE() { sudo pacman -Syyu; }
        ;;
    'Manjaro')
        INSTALL() { sudo pacman -S --needed $@; }
        UPDATE() { sudo pacman -Syyu; }
        ;;
    'Ubuntu')
        INSTALL() { sudo apt install -y --allow-unauthenticated $@; }
        UPDATE() { sudo apt update && sudo apt upgrade -y; }
        ;;
    *)
        echo 'Your distribution has not implementd yet, please modify this command'
        exit 1
        ;;
esac;

read -p "input install mode['server', 'desktop']: " MODE
case $MODE in
    'server')
        for line in `cat "./package/$OS-server-package.txt"`
        do
            echo $line
        done
        ;;
    'desktop')
        for line in `cat "./package/$OS-desktop-package.txt"`
        do
            echo $line
        done
        ;;
    *)
        echo 'The mode has not implementd yet, please modify this command'
        exit 1
        ;;
esac;

pip3 install --user pynvim

case $OS in
    'Arch')
        ;;
    'Manjaro')
        ;;
    'Ubuntu')
        # i3
        sudo add-apt-repository ppa:kgilmer/speed-ricer
        UPDATE
        INSTALL i3 i3-gaps arandr dunst polybar
        # latex
        INSTALL texlive-latex-base latex-cjk-all texlive-latex-extra texlive-xetex
        # ocr
        INSTALL tesseract-ocr tesseract-ocr-chi-sim
        # clangd-9
        INSTALL clangd-9
        sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100
        ;;
    *)
        echo 'Your distribution has not implementd yet, please modify this command'
        exit 1
        ;;
esac;

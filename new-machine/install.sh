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
        for line in `cat "./$OS.txt"`
        do
            echo $line
        done
        ;;
    'desktop')
        for line in `cat "./$OS.txt"`
        do
            echo $line
        done
        ;;
    *)
        echo 'The mode has not implementd yet, please modify this command'
        exit 1
        ;;
esac;

case $OS in
    'Arch')
        ;;
    'Manjaro')
        ;;
    'Ubuntu')
        # npm and nodejs
        curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
        INSTALL nodejs npm
        # i3
        sudo add-apt-repository ppa:kgilmer/speed-ricer
        UPDATE && INSTALL i3 i3-gaps arandr dunst polybar
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

# pypi
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U --user
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install --user pipreqs
pip3 install --user pynvim


# git
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions  
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

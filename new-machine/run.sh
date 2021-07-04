#!/bin/bash

# # install package in file content list
# read -p "input filepath: " FILE
# for line in `cat $FILE`
# do
#     sudo pacman -S --noconfirm $line
# done



# sudo apt install \
#          2to3\
#          vim\
#          git\
#          tig\
#          feh\
#          zsh\
#          tmux\
#          tldr\
#          silversearcher-ag\
#          curl\
#          wget\
#          build-essential\
#          gdb\
#          ranger\
#          python3-pip\
#          cmake \
#          python3-dev\
#          ipython3\
#          nodejs\
#          npm\
#          pdftk\
#          openssh-server\
#          proxychains\
#          clang\
#          clangd\
#          fcitx\
#          fcitx-sunpinyin\
#          flameshot\
#          vim-gtk3\
#          trash-cli\
#          mpv\
#          shellcheck\
#          clang-format\
#          imagemagick\
#          cloc\
#          htop\

# sudo apt install
#          net-tools\
#          mono-complete\
#          golang\
#          texlive-full\
#          mysql-server\
#          network-manager\
#          sqlite3\
#          sqlite3-doc\
#          brightnessctl\
#          zathura\
sudo apt install\
         doxygen\
         doxygen-doc\
         doxygen-gui\

sudo apt install texlive-base texlive-xetex texlive-lang-chinese biber

sudo snap install xmind vscode 

sudo snap install mathpix-snipping-tool
sudo apt install graphviz graphviz-doc
sudo apt install zathura
sudo apt-get install gnome-shell-extension-system-monitor

sudo apt install net-tools

wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
# or run:
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
# add Typora's repository
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
# install typora
sudo apt-get install typora


sudo apt install lollypop # music
sudo snap install foliate # epub reader
sudo apt install kazam # record screen

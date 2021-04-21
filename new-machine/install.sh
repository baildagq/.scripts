#!/bin/bash

OS=$(cat /etc/issue | cut -f 1 -d ' ')
read -p "input install mode['server', 'desktop']: " MODE
case $OS in
    'Arch')
        ;;
    'Manjaro')
        ;;
    'Ubuntu')
        ;;
    *)
        echo 'Your distribution has not implementd yet, please modify this command'
        exit 1
        ;;
esac;

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

# github-cli
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# bazel
sudo apt install curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel
sudo apt update && sudo apt full-upgrade

# npm
NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin
sudo ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin
# peer/keytar/

# docker
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-compose

# nodejs
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
INSTALL nodejs npm

# snap
git clone https://aur.archlinux.org/snapd.git
cd snapd
makepkg -si
# sudo systemctl enable -now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

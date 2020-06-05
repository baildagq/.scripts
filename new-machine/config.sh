#!/bin/bash

cd
if  [ -d ~/.dotfiles ];then
    git clone https://github.com/qistout/.dotfiles.git ~/.dotfiles
fi

# make soft-link
cd ~/.dotfiles
paths=(
    '.config/alacritty'
    '.config/codestyle'
    '.config/dunst'
    '.config/feh'
    '.config/i3'
    '.config/openvpn'
    '.config/pip'
    '.config/polybar'
    '.config/ranger'
    #'.config/rofi'
    '.config/zathura'
    '.config/nvim'

    '.bashrc'
    '.condarc'
    '.gitaliases'
    '.gitconfig'
    '.keynavrc'
    '.shellconfig'
    '.tmux.conf' 
    '.vim'
    '.xmodmap'
    'xorg.conf.d'
    '.xprofile'
    '.Xresources'
    '.zshrc_omz'
    # '.zshrc_zpl'
)

for item in ${paths[*]}
do
    # judge whether dotfile exist
    if test -e $item
    then
        if test "$item" = ".zshrc_omz" -o "$item" = ".zshrc_zpl"
        then
            ln -s ~/.dotfiles/$item ~/.zshrc
        elif test "$item" = "xorg.conf.d"
        then
            if [ -e ~/$item ]
            then
                sudo mv /etc/X11/xorg.conf.d /etc/X11/xorg.conf.d.back
                sudo ln -s ~/.dotfiles/$item /etc/X11/
            fi
        else
            if [ -h ~/$item ]
            then
                rm ~/$item
            fi
            if [ -e ~/$item ]
            then
                mv ~/$item ~/$item.back 
            fi
            ln -s ~/.dotfiles/$item ~/$item
        fi
    fi
done

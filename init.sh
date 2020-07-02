setxkbmap -option caps:ctrl_modifier
brightnessctl --device='asus::kbd_backlight' set 1 > /dev/null
brightnessctl --device='asus::kbd_backlight' set 0 > /dev/null
ID=齐金生 && nmcli device wifi connect $ID > /dev/null

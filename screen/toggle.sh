#!/bin/bash
activenumber=$(xrandr --listactivemonitors | awk -v s='1' 'BEGIN{split(s, a, ","); for (i in a) b[a[i]]} NR in b' | cut -d' ' -f2)

if [ "$activenumber" -eq '2' ]
then
    # active inner only
    xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-1 --off
    feh --bg-scale ~/Picture/grey.png
else
    xrandr --listactivemonitors | grep "eDP-1"
    inneractive=$?
    if [ $inneractive -eq 0 ]
    then
        # active outer only
        xrandr --output eDP-1 --off --output HDMI-1 --mode 2560x1440 --pos 0x0 --rotate normal
        feh --bg-scale ~/Picture/grey.png
    else
        # active both
        xrandr --output eDP-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output HDMI-1 --primary --mode 2560x1440 --pos 0x0 --rotate normal
        feh --bg-scale ~/Picture/grey.png
    fi
fi

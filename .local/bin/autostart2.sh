#!/bin/sh
. $HOME/.cache/wal/colors.sh

#Configure Monitors
randr-config

# picom -bc
xcompmgr -c &
xbacklight =50
xwallpaper --zoom "$HOME/.config/wall.jpg"

xset b 0 0 0 && xset b off && xset s off && xset -dpms

#Start Daemons
# ~/agd/slstatus/slstatus &
# clipboard-polling.sh &

#Startup Programs
# pavucontrol &
# gnome-system-monitor &
# agtop &

# xsetroot -cursor_name left_ptr
# trayer --edge top --align right --SetDockType true --expand true --transparent true --widthtype request --tint 0x000000 -l &
batsignal &
tint2 &
volumeicon &

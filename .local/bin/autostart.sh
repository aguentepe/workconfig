#!/bin/sh

! [ -d "$HOME/.cache/wal" ] && wal-link /usr/share/wallpapers/deepin/Sunrise_by_Alexandre_Godreau.jpg

run() {
  if ! pgrep -f "$1"
  then
    "$@"&
  fi
}

# autorandr -c
start-pulseaudio-x11
xwallpaper --zoom "$HOME/.config/wall.jpg"
xset b 0 0 0 && xset b off && xset s off && xset -dpms
run udiskie
run picom -c -i 1
run nm-applet
run cbatticon
xbacklight =50

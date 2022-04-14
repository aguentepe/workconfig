#!/bin/sh

xrdb ${XDG_CONFIG_HOME:-$HOME/.config}/x11/xresources

setxkbmap us altgr-intl
sxhkd &

exec openbox-session

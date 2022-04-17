#!/bin/sh

! [ -d "$HOME/.cache/wal" ] && wal-link /usr/share/wallpapers/deepin/Sunrise_by_Alexandre_Godreau.jpg

autostart2.sh

[ -f /tmp/autostart.isrunning ] && echo 'autostart.sh: already running' && exit
touch /tmp/autostart.isrunning

pipewire &
pipewire-pulse &
wireplumber &
# sudo wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf

# sudo wakeup_fix

#Start Daemons
dunst &
thttpd -p 8457 -d .local/share/www
# clipboard-polling.sh &

#Startup Programs
avpn &
udiskie &

# while true; do
# 	# xsetroot -name "$(date +'%H:%M:%S')"
# 	# sleep 2
# 	[ "$(cat /sys/class/power_supply/BAT0/capacity)" -lt 20 ] &&
# 		notify-send "Battery Low" -u critical
# 	sleep 180
# done

#!/bin/sh

. bin/autostart2.sh

[ -f /tmp/autostart.isrunning ] && echo 'autostart.sh: already running' && exit
touch /tmp/autostart.isrunning

# sudo wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf

sudo wakeup_fix

#Start Daemons
dunst &
thttpd -p 8457 -d .local/share/www
# clipboard-polling.sh &

#Startup Programs
avpn &
udiskie &

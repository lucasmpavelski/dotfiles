#! /bin/bash

~/.config/dwm/bar &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
compton --config ~/.config/compton.conf &
nitrogen --restore &
dunst &
clipmenud &

#!/bin/sh

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dwmblocks &
picom --config ~/.config/picom.conf &
nitrogen --restore &
dunst &
clipmenud &

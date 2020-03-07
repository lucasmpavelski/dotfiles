#
# ~/.zprfile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc

# autostart x at login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

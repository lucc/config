# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# remap capslock
if [ -z "$SSH_CLIENT" -a -n "$DISPLAY" ]; then
  # this should be moved to Xrecources or xinit
  xmodmap -e "add control = Caps_Lock"
fi

if [ -n "$SSH_CLIENT" ]; then
  #calendar
  exec zsh
fi
#!/bin/sh
# ~/.xinitrc file by luc
# vim: filetype=sh

dir=${XDG_CONFIG_HOME:-$HOME/.config}/xinit

ask_yes () {
  zenity --question --timeout 3 --text "$1"
  case $? in
    0|5) return 0;;
    1) return 1;;
    *) echo Unknown return value from zenity. >&2; return 2;;
  esac
}
ask_no () {
  zenity --question --timeout 3 --text "$1"
  case $? in
    0|5) return 1;;
    1) return 0;;
    *) echo Unknown return value from zenity. >&2; return 2;;
  esac
}

set_env () {
  # The custom theme variables used by other scripts (awesome rc files and
  # colorscheme.sh).
  export THEME=${THEME:-SOLARIZED}
  export theme=${theme:-solarized}
  export TONE=${TONE:-DARK}
  export tone=${tone:-dark}
}
setup_urxvt () {
  #export RXVT_SOCKET="$ddir/urxvt/urxvtd-`hostname`"
  export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd.socket
  #systemctl --user start urxvtd.socket
}
setup_pulseaudio () {
  pactl load-module module-x11-bell
}

source_global_xinit () {
  # copied from the arch linux default xinitrc file.
  if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
      [ -x "$f" ] && . "$f"
    done
    unset f
  fi
}
setup_keyboard () {
  setxkbmap -option terminate:ctrl_alt_bksp -layout de
  xmodmap "$dir/Xmodmap"
}
setup_colors () {
  xrdb -merge -DTONE="$TONE" -DTHEME="$THEME" "$dir/Xresources"
}
cbatticon_power_manager () {
  # use cbatticon as a simple power manager
  cbatticon \
    --low-level 10 \
    --command-critical-level "sh -c 'check-suspend.sh -d 30'" &
}
load_ssh_keys () {
  SSH_ASKPASS=$(which pass-as-ssh-askpass.sh) \
    ssh-add "$HOME"/.ssh/*id_rsa < /dev/null
}
autostart () {
  #systemctl --user start urxvtd
  sleep 20 && systemctl --user start mpd-notification &
  browser &
}

# We can either go into a full WM/DE wnvironment or a kisosk mode.
full_setup () {
  #set_env
  setup_pulseaudio
  #setup_urxvt
  #setup_keyboard
  #setup_colors
  ask_yes "Do you want a full start?" && autostart &
  sleep 60 && load_ssh_keys &
}
kiosk_setup () {
  setup_pulseaudio
  #setup_keyboard
}

# first call some general initialisation code that should be run for every
# environment
source_global_xinit

# select the correct programm to exec (and optionally call additional init
# functions)
if [ $# -eq 0 ]; then
  set awesome
fi
if [ $# -eq 1 ]; then
  # run some WM/DE specific init functions and set the command to exec
  case "$1" in
    awesome|openbox|xmonad|i3|qtile)
      auto-xrandr &
      full_setup
      #cbatticon_power_manager &
      ;;
    gnome)
      full_setup
      set gnome-session;;
    kde)
      full_setup
      set startkde;;
    lxde)
      full_setup
      if which startlxde; then set startlxde
      else set lxsession
      fi;;
    xfce)
      full_setup
      if which startxfce4; then set startxfce4
      else set xfce4-session
      fi;;
    music-kiosk)
      kiosk_setup
      set cantata;;
    web-kiosk)
      kiosk_setup
      set firefox -P guest;;
  esac
fi

# start the window manager or desktop environment
exec "$@"

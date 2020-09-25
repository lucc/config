#!/bin/sh

if [ -z "$1" ]; then
  exec printf '%s\n' \
    play/pause \
    next \
    previous \
    random \
    gui \
    stop \

fi

case $1 in
  gui) cantata &;;
  tui) term -e ncmpcpp &;;
  play/pause) mpc toggle;;
  *) mpc "$1";;
esac >/dev/null 2>&1

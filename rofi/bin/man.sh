#!/bin/sh
if [ $# -eq 0 ]; then
  apropos .
  exit
else
  man=${1%% *}
  sec=${1#* (}
  sec=${sec%) *}
  # Why does this fail on any output be it on stdout or stderr?
  (term -e "man -s $sec $man" & ) >/dev/null 2>&1
fi

#!/usr/bin/env zsh

if [ "$1" = quit ]; then exit; fi


cd ~/img

ls *(.) | sed "s#.*#&\\x00image\\x1ffile://$HOME/img/&#"

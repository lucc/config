#!/bin/sh

read_xdg_cache () {
  tac ~/.cache/rofi-xdg-open-mru-list.txt \
    | sort --uniq --stable --key 2
}
read_zathura_cache () {
  #sed -n 's/^\[\(.*\)\]$/\1/p' ~/.local/share/zathura/history | stest -f | tac
  sed 's/^\[\(.*\)\]$/file=\1/p; /^time=[0-9]*$/p' -n ~/.local/share/zathura/history \
    | sed '/^file=/ { N; s/^file=\(.*\)\ntime=\([0-9]*\)$/\2 \1/; }'
}
all_caches () {
  read_xdg_cache
  read_zathura_cache
}

if [ -z "$1" ]; then
  all_caches \
    | sort -n -r \
    | cut -f2- -d ' ' \
    | stest -f
else
  xdg-open "$1" >/dev/null 2>&1 &
fi

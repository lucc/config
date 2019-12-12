#!/bin/sh

if [ $# -eq 0 ]; then
  abq.sh . | awk '{print $1}' | grep -v '^+\?[0-9]*@'
else
  (term -e sms "$@" & ) >/dev/null 2>&1
fi

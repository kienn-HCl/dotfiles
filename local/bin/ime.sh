#!/bin/bash -u

TMP_FILE="/tmp/ime"
foot -T "vim ime" nvim $TMP_FILE || exit 1
if [[ -e $TMP_FILE ]]; then
    wl-copy -n < "$TMP_FILE"
    wl-copy -np < "$TMP_FILE"
    ydotool key 42:1 110:1 110:0 42:0
    notify-send -t 1000 "Enterd Text"
    rm -f "$TMP_FILE"
fi


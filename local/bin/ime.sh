#!/bin/bash -u

foot -T "vim ime" nvim /tmp/ime || exit 1
if [[ -e /tmp/ime ]]; then
    wl-copy -n < /tmp/ime
    notify-send -t 1000 copied
    rm -f /tmp/ime
fi


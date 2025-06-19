#!/bin/bash -u

foot -T "vim ime" nvim /tmp/ime || exit 1
if [[ -e /tmp/ime ]]; then
    echo -n "$(< /tmp/ime)" | wtype -
    foot sleep 0.001
    notify-send -t 1000 copied
    rm -f /tmp/ime
fi


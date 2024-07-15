#!/bin/bash -u

foot nvim /tmp/ime || exit 1
if [[ -e /tmp/ime ]]; then
    cat /tmp/ime | wl-copy
    notify-send -t 1000 copied
    rm -f /tmp/ime
fi


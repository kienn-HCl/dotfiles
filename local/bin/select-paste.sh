#!/usr/bin/env bash
set -eo pipefail
cliphist list | rofi -dmenu | cliphist decode | wl-copy && echo -n "$(wl-paste -n)" | wtype -
foot sleep 0.001

#!/usr/bin/env bash
set -eo pipefail
cliphist list | rofi -dmenu | cliphist decode | wl-copy && wl-paste -n | wtype -

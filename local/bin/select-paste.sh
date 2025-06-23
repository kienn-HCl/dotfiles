#!/usr/bin/env bash
set -eo pipefail
COPIED_TEXT=$(cliphist list | rofi -dmenu | cliphist decode)
wl-copy -n "$COPIED_TEXT"
wl-copy -np "$COPIED_TEXT"
ydotool key 42:1 110:1 110:0 42:0

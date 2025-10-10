#!/bin/bash -u

TMP_FILE="/tmp/ime.txt"
EDITOR="${EDITOR:-vim}"

if command -v foot >/dev/null 2>&1; then
  foot -T "vim ime" "$EDITOR" $TMP_FILE || exit 1
elif command -v alacritty>/dev/null 2>&1; then
  alacritty -T "vim ime" -e "$EDITOR" $TMP_FILE || exit 1
else
  echo "Please install foot or alacritty." >&2
  notify-send -t 1000 "Please install foot or alacritty."
  exit 1
fi
if [[ -e $TMP_FILE ]]; then
    wl-copy -n < "$TMP_FILE"
    wl-copy -np < "$TMP_FILE"
    ydotool key 42:1 110:1 110:0 42:0
    notify-send -t 1000 "Enterd Text"
    rm -f "$TMP_FILE"
fi


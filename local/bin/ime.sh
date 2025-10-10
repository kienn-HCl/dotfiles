#!/bin/bash -u

TMP_FILE="/tmp/ime.txt"
EDITOR="${EDITOR:-vim}"
if [ -z "${TERM+x}" ]; then
  echo "Please define \$TERM. Cannot identify the terminal application." >&2
  notify-send -t 1000 "Please define \$TERM. Cannot identify the terminal application."
  exit 1
fi

if [ "$TERM" = "foot" ]; then
  foot -T "vim ime" nvim $TMP_FILE || exit 1
else
  $TERM "$EDITOR" $TMP_FILE || exit 1
fi
if [[ -e $TMP_FILE ]]; then
    wl-copy -n < "$TMP_FILE"
    wl-copy -np < "$TMP_FILE"
    ydotool key 42:1 110:1 110:0 42:0
    notify-send -t 1000 "Enterd Text"
    rm -f "$TMP_FILE"
fi


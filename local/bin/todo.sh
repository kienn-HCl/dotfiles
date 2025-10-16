#!/bin/bash -u

TODOFILE="${TODOFILE:-$HOME/.todo.md}"
EDITOR=${EDITOR:-vim}

if command -v foot >/dev/null 2>&1; then
  foot -T "My todo $TODOFILE" "$EDITOR" "$TODOFILE" || exit 1
elif command -v alacritty>/dev/null 2>&1; then
  alacritty -T "My todo $TODOFILE" -e "$EDITOR" "$TODOFILE" || exit 1
else
  echo "Please install foot or alacritty." >&2
  notify-send -t 1000 "Please install foot or alacritty."
  exit 1
fi

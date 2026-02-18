#!/bin/bash -u

EDITOR=${EDITOR:-vim}
FILE="${1:-.}"
DIR=$(dirname "$FILE")
[[ -d "$DIR" ]] || mkdir -p "$DIR"

if command -v foot >/dev/null 2>&1; then
  foot -T "My edit $FILE" "$EDITOR" "$FILE" || exit 1
elif command -v alacritty >/dev/null 2>&1; then
  alacritty -T "My edit $FILE" -e "$EDITOR" "$FILE" || exit 1
else
  echo "Please install foot or alacritty." >&2
  notify-send -t 1000 "Please install foot or alacritty."
  exit 1
fi

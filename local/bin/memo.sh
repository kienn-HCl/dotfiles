#!/bin/bash -u

MEMODIR="${MEMODIR:-$HOME/.memo}"
MEMOFILE="$MEMODIR/$(date '+%F').md"
EDITOR=${EDITOR:-vim}
[[ -d "$MEMODIR" ]] || mkdir "$MEMODIR"

if command -v foot >/dev/null 2>&1; then
  foot -T "My memo $MEMOFILE" "$EDITOR" "$MEMOFILE" || exit 1
elif command -v alacritty>/dev/null 2>&1; then
  alacritty -T "My memo $MEMOFILE" -e "$EDITOR" "$MEMOFILE" || exit 1
else
  echo "Please install foot or alacritty." >&2
  notify-send -t 1000 "Please install foot or alacritty."
  exit 1
fi

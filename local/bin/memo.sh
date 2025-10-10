#!/bin/bash -u

MEMODIR="${MEMODIR:-$HOME/.memo}"
MEMOFILE="$MEMODIR/$(date '+%F').md"
EDITOR=${EDITOR:-vim}
if [ -z "${TERM+x}" ]; then
  echo "Please define \$TERM. Cannot identify the terminal application." >&2
  notify-send -t 1000 "Please define \$TERM. Cannot identify the terminal application."
  exit 1
fi
[[ -d "$MEMODIR" ]] || mkdir "$MEMODIR"

if [ "$TERM" = "foot" ]; then
  foot -T "memo $MEMOFILE" "$EDITOR" "$MEMOFILE" || exit 1
else
  $TERM "$EDITOR" "$MEMOFILE" || exit 1
fi

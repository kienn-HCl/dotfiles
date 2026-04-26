#!/bin/bash -eu

tmpfile=$(mktemp --suffix=.png)
trap 'rm -f "$tmpfile"' EXIT

grim -g "$(slurp)" "$tmpfile" || exit 1

# manga_ocrのNixラッパーからPythonインタプリタとsite-packages設定を取得
WRAPPED="$(dirname "$(readlink -f "$(which manga_ocr)")")/.manga_ocr-wrapped"
PYTHON="$(head -1 "$WRAPPED" | cut -c3-)"
SITE_SETUP="$(sed -n '3p' "$WRAPPED")"

text=$("$PYTHON" -c "${SITE_SETUP}
import sys
from manga_ocr import MangaOcr
mocr = MangaOcr()
print(mocr(sys.argv[1]))
" "$tmpfile" 2>/dev/null)

if [[ -n "$text" ]]; then
    printf '%s' "$text" | wl-copy -n
    printf '%s' "$text" | wl-copy -np
    notify-send -t 2000 "OCR" "$text"
else
    notify-send -t 2000 "OCR" "テキストを検出できませんでした"
fi

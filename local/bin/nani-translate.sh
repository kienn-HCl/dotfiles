#!/usr/bin/env bash
set -euo pipefail

# 1. PRIMARY選択 → CLIPBOARDの順でテキスト取得
text="$(wl-paste --primary 2>/dev/null || true)"
if [[ -z "$text" ]]; then
    text="$(wl-paste 2>/dev/null || true)"
fi

if [[ -z "$text" ]]; then
    notify-send -t 3000 "Nani翻訳" "テキストが取得できませんでした (選択またはコピー後に実行)"
    exit 1
fi

printf '%s' "$text" | wl-copy -n

# 2. app_idがnaniを含む既存ウィンドウを検索
nani_id="$(
    niri msg --json windows \
    | jq -r '.[] | select((.app_id // "") | test("^chrome-nani\\.now"; "i")) | .id' \
    | head -1
)"

if [[ -n "$nani_id" ]]; then
    niri msg action focus-window --id "$nani_id"
    sleep 0.3
else
    chromium --app=https://nani.now/ >/dev/null 2>&1 &
    sleep 1.8
fi

# 3. modifier解放を待ってからCtrl+Vでペースト
sleep 0.15
ydotool key 29:1 47:1 47:0 29:0

#!/usr/bin/env bash

set -euo pipefail

# Missing tools (eg inside a Docker sandbox)
command -v notify-send >/dev/null 2>&1 || exit 0
command -v jq >/dev/null 2>&1 || exit 0

ICON="$HOME/.config/claude/scripts/icon.svg"
message="$(jq -r '.message // "Claude needs your attention"')"

notify-send -i "$ICON" "Claude Code" "$message"

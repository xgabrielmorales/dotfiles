#!/usr/bin/env bash

set -euo pipefail

# Missing tools (eg inside a Docker sandbox)
command -v jq >/dev/null 2>&1 || exit 0

input=$(cat)

model=$(jq -r '.model.display_name' <<<"$input")
ctx=$(jq -r '.context_window.used_percentage // 0' <<<"$input")
session=$(jq -r '.rate_limits.five_hour.used_percentage // 0' <<<"$input")
resets_at=$(jq -r '.rate_limits.five_hour.resets_at // 0' <<<"$input")
effort=$(jq -r '.effort.level // "-"' <<<"$input")
dir=$(jq -r '.workspace.current_dir // .cwd // ""' <<<"$input")
dir=${dir/#$HOME/\~}

if [ "$resets_at" -gt 0 ]; then
	rem=$(( resets_at - $(date +%s) ))
	[ "$rem" -lt 0 ] && rem=0
	reset=$(printf "%dhr %02d" $(( rem / 3600 )) $(( rem % 3600 / 60 )))
else
	reset="-"
fi

printf "%s (%s) | Context: %.1f%% | Session: %.1f%% | Reset: %s\n" \
	"$model" \
	"$effort" \
	"$ctx" \
	"$session" \
	"$reset"

printf "%s\n" "$dir"

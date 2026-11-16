#!/usr/bin/env bash

# See: https://github.com/anthropics/claude-code/issues/42229

# Missing tools (eg inside a Docker sandbox)
command -v direnv >/dev/null 2>&1 || exit 0

[ -n "$CLAUDE_ENV_FILE" ] || exit 0

snapshot="${CLAUDE_ENV_FILE}.snapshot"

if ! grep -qF "$snapshot" "$CLAUDE_ENV_FILE" 2>/dev/null; then
    echo ". \"$snapshot\"" >> "$CLAUDE_ENV_FILE"
fi

{
    (
        unset DIRENV_DIR
        unset DIRENV_FILE
        unset DIRENV_DIFF
        unset DIRENV_WATCHES
        direnv export bash 2>/dev/null
    )
    echo true
} > "$snapshot"

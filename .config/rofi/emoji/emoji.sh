#!/usr/bin/env bash

ROFI_CONFIG_FILE="${XDG_CONFIG_HOME}/rofi/emoji/emoji.rasi"

rofi \
    -show emoji \
    -theme "$ROFI_CONFIG_FILE" \
    -modi emoji \
    -emoji-format '{emoji} {keywords}' \
    -p > /dev/null

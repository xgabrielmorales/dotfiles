#!/usr/bin/bash

ROFI_CONFIG_FILE="$HOME/dotfiles/.config/rofi/default/rofi-emoji.rasi"

rofi \
    -show emoji \
    -theme "$ROFI_CONFIG_FILE" \
    -modi emoji \
    -emoji-format '{emoji} {keywords}'
    -p > /dev/null

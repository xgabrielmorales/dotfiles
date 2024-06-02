#!/usr/bin/bash

ROFI_CONFIG_FILE="$HOME/dotfiles/.config/rofi/default/rofi-calc.rasi"

rofi -show calc \
    -theme "$ROFI_CONFIG_FILE" \
    -modi calc \
    -no-show-match \
    -no-sort \
    -calc-command "echo -n '{result}' | xclip -selection clipboard" \
    -p >/dev/null

#!/usr/bin/env bash

ROFI_CONFIG_FILE="${XDG_CONFIG_HOME}/rofi/default/rofi-calc.rasi"

rofi -show calc \
    -theme "$ROFI_CONFIG_FILE" \
    -modi calc \
    -no-show-match \
    -no-sort \
    -calc-command "echo -n '{result}' | xclip -selection clipboard" \
    -p >/dev/null

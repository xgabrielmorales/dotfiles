#!/usr/bin/env bash

ROFI_CONFIG_FILE="${XDG_CONFIG_HOME}/rofi/calc/calc.rasi"

rofi -show calc \
    -theme "$ROFI_CONFIG_FILE" \
    -modi calc \
    -no-show-match \
    -no-sort \
    -calc-command "echo -n '{result}' | wl-copy" \
    -p >/dev/null

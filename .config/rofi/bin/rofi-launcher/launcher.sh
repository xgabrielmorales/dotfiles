#!/usr/bin/env bash

ROFI_CONFIG_FILE="$HOME/.config/rofi/colors.rasi"
ROFI_CACHE_DIR="$HOME/.local/share/rofi"

rofi -show drun -theme xgm -sorting-method fzf -sort  -cache-dir "$ROFI_CACHE_DIR"

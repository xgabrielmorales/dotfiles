#!/usr/bin/env bash

ROFI_CONFIG_FILE="${XDG_CONFIG_HOME}/rofi/colors.rasi"
ROFI_CACHE_DIR="${XDG_DATA_HOME}/rofi"

rofi -show drun -theme xgm -sorting-method fzf -sort  -cache-dir "$ROFI_CACHE_DIR"

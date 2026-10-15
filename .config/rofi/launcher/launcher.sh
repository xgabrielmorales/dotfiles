#!/usr/bin/env bash

ROFI_CACHE_DIR="${XDG_DATA_HOME}/rofi"

rofi -show drun -theme xgm -sorting-method fzf -sort  -cache-dir "$ROFI_CACHE_DIR"

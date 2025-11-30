#!/usr/bin/env bash

ROFI_CONFIG_FILE="$HOME/.config/rofi/colors.rasi"
ROFI_CACHE_DIR="$XDG_DATA_HOME/rofi"

COLORS=('#bf616a' '#d08770' '#ebcb8b' '#a3be8c' '#b48ead' '#88c0d0')

AC="${COLORS[$(( $RANDOM % 6 ))]}"

sed --in-place --expression "s/ac: .*/ac:   ${AC}FF;/g" "$ROFI_CONFIG_FILE"
sed --in-place --expression "s/se: .*/se:   ${AC}40;/g" "$ROFI_CONFIG_FILE"

rofi -show drun -theme xgm -sorting-method fzf -sort  -cache-dir "$ROFI_CACHE_DIR"

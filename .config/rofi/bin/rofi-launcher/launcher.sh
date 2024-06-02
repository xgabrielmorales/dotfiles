#!/usr/bin/bash

ROFI_CONFIG_FILE="$HOME/.config/rofi/colors.rasi"

COLORS=('#bf616a' '#d08770' '#ebcb8b' '#a3be8c' '#b48ead' '#88c0d0')

AC="${COLORS[$(( $RANDOM % 6 ))]}"

sed --in-place --expression "s/ac: .*/ac:   ${AC}FF;/g" "$ROFI_CONFIG_FILE"
sed --in-place --expression "s/se: .*/se:   ${AC}40;/g" "$ROFI_CONFIG_FILE"

rofi -show drun -theme xgm

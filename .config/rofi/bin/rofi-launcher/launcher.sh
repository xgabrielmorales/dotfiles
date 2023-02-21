#!/usr/bin/env bash

FILE="$HOME/.config/rofi/colors.rasi"

# random accent color
COLORS=('#bf616a' '#d08770' '#ebcb8b' '#a3be8c' '#b48ead' '#88c0d0')

AC="${COLORS[$(( $RANDOM % 6 ))]}"
echo $AC

sed --in-place --expression "s/ac: .*/ac:   ${AC}FF;/g" "$FILE"
sed --in-place --expression "s/se: .*/se:   ${AC}40;/g" "$FILE"

rofi -show drun -theme xgm

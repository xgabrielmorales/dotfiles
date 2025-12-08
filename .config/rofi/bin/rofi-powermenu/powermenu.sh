#!/usr/bin/env bash

ROFI_CONFIG_DIR="${XDG_CONFIG_HOME}/rofi/default"
ROFI_COMMAND="rofi -theme $ROFI_CONFIG_DIR/rofi-powermenu.rasi -dmenu"

chosen=$(
    printf "%s\n%s\n%s\n%s\n%s" \
        " Lock" \
        " Sleep" \
        " Logout" \
        " Restart" \
        " Shutdown" |
        $ROFI_COMMAND
)

case $chosen in
    " Lock")
        betterlockscreen -l
        ;;
    " Sleep")
        systemctl suspend
        ;;
    " Logout")
        i3-msg exit || openbox --exit
        ;;
    " Restart")
        systemctl reboot
        ;;
    " Shutdown")
        systemctl poweroff
        ;;
esac

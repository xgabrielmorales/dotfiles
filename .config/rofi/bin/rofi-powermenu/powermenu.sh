#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/default"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/rofi-powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"
chosen="$(echo -e "$options" | $rofi_command -p "$uptime" -dmenu)"

case $chosen in
    $shutdown)
        mpc --quiet clear
        systemctl poweroff
    ;;
    $reboot)
        mpc --quiet clear
        systemctl reboot
    ;;
    $lock)
        mpc --quiet pause
        betterlockscreen -l
    ;;
    $suspend)
        mpc --quiet pause
        systemctl suspend
    ;;
    $logout)
        mpc --quiet clear
        i3-msg exit || openbox --exit
    ;;
esac

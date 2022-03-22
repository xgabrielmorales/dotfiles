#!/usr/bin/env bash

DEFAULT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")

mic_status() {
	status=$(pactl list sources | grep -A 10 $DEFAULT_SOURCE | grep -o "Mute: yes")
	volume=$(pactl list sources | grep -A 10 $DEFAULT_SOURCE | grep 'Volume:' -m 1 | awk '{print $5}')
	[[ $status == "Mute: yes" ]] && echo  || echo " $volume";
}

case $1 in
	"--status")
			mic_status
		;;
	"--toogle")
			pactl set-source-mute @DEFAULT_SOURCE@ toggle
			polybar-msg action "#microphone.hook.0"
		;;
	"--inc")
			pactl set-source-volume @DEFAULT_SOURCE@ +5%
			polybar-msg action "#microphone.hook.0"
		;;
	"--dec")
			pactl set-source-volume @DEFAULT_SOURCE@ -5%
			polybar-msg action "#microphone.hook.0"
		;;
esac

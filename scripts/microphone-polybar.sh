#!/usr/bin/env bash

toogle_mic() {
	pactl set-source-mute @DEFAULT_SOURCE@ toggle
}

mic_status() {
	DEFAULT_SOURCE=$(pactl info | grep "Default Source" | cut -f3 -d" ")
	status=$(pactl list sources | grep -A 10 $DEFAULT_SOURCE | grep -o "Mute: yes")
	[[ $status == "Mute: yes" ]] && echo  || echo ;
}

case $1 in
	"--toogle")
		toogle_mic
		mic_status
		;;

	"--status")
		mic_status
		;;
esac

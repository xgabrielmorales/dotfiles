#!/usr/bin/env bash

function toogle_mic() {
	pacmd list-sources | \
		grep -oP 'index: \d+' | \
		awk '{ print $2 }' | \
		xargs -I{} pactl set-source-mute {} toggle
}

function mic_status() {
	 status=$(pacmd list-sources | grep -P "muted: " | awk '{print $2}' | head -n1)

	 [[ $status == "yes" ]] && echo   || echo ;
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

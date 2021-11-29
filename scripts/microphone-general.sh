#!/usr/bin/env bash

pacmd list-sources | \
	grep -oP 'index: \d+' | \
	awk '{ print $2 }' | \
	xargs -I{} pactl set-source-mute {} toggle

polybar-msg hook microphone 1

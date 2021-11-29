#!/bin/bash

time_remain=$(calcurse --next | grep -oP "(?<=\[).*(?=\])")

if [ $time_remain == "00:05" ]; then
	calcurse --next | \
		grep -oP "]\s+\K[\w ()áéíóú]+" | \
		xargs -0 \
		notify-send "Next appointment"
fi

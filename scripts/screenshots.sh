#!/bin/bash

case $1 in
	"Screen")
		maim | \
		tee ~/Pictures/Screenshots/ss.$(date +'%m-%d-%y.%H-%M-%S').png | \
		xclip -selection clipboard \
			-target image/png \
			-in
		;;
	"Selection")
		maim --select \
			--hidecursor |
		tee ~/Pictures/Screenshots/ss.$(date +'%m-%d-%y.%H-%M-%S').png | \
		xclip -selection clipboard \
			-target image/png \
			-in
esac

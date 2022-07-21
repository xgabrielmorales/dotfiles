#!/bin/bash

# Instead of running a new terminal recycle the existing one.
# This is useful as my terminal runs a tmux session by default.

alacritty_wid=$(wmctrl -l | grep "Alacritty" | cut -d " " -f 1)

if [ -n "$alacritty_wid" ]; then
	wmctrl -ir "$alacritty_wid" -b remove,hidden; wmctrl -ia $alacritty_wid
else
	alacritty &
fi

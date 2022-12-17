#!/usr/bin/bash

rofi -show calc     \
	 -theme xgm     \
	 -modi calc     \
	 -no-show-match \
	 -no-sort       \
	 -calc-command "echo -n '{result}' | xclip -selection clipboard"
	 -p > /dev/null

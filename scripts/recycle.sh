#!/bin/bash

# Instead of running a new program recycle the existing one.

BINARY=$(which $1)
WINDOW_NAME=$2

WINDOW=$(wmctrl -l | grep "$WINDOW_NAME$" | cut -d " " -f 1)

if [ -n "$WINDOW" ]; then
    wmctrl -ir "$WINDOW" -b remove,hidden; wmctrl -ia "$WINDOW"
else
    $BINARY &
fi

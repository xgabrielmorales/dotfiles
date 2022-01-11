#!/bin/bash

PING=$(ping 8.8.8.8 -c 1 | sed -n "2p" | cut -d "=" -f 4)

[[ "$PING" == "" ]] && \
	notify-send "Network Status" " No Internet Connection" --expire-time 1200 || \
	notify-send "Network Status" " $PING" --expire-time 1200

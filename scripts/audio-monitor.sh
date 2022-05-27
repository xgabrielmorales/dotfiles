#!/bin/bash

INPUT=$(pactl get-default-source)
OUTPUT=$(pactl get-default-sink)

pacat \
	--record \
	--latency-msec=1 \
	--device $INPUT | \
	pacat \
		--playback \
		--latency-msec=2 \
		--device $OUTPUT
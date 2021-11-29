#!/bin/bash

arecord \
	--format="cd" \
	--device="hw:1,0" \
	--duration=0 \
	$HOME/Recordings/rc.$(date +'%m-%d-%y.%H-%M-%S').wav

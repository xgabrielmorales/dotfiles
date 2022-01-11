#!/bin/bash

output=$(pacmd list | awk '{if(/active port:/) print $3}' | head -n 1)

headphones_icon="/usr/share/icons/ePapirus/24x24/devices/audio-headphones.svg"
line_out_icon="/usr/share/icons/ePapirus/24x24/devices/audio-speakers.svg"

echo $output

if [ "$output" = "<analog-output-headphones>" ]; then
	pacmd set-sink-port alsa_output.pci-0000_38_00.6.analog-stereo analog-output-lineout
	notify-send \
		"Audio Control" \
		"<b>Line out</b> have been configured as audio output" \
		--expire-time=1200 \
		--icon=$line_out_icon
elif [ "$output" = "<analog-output-lineout>" ]; then
	pacmd set-sink-port alsa_output.pci-0000_38_00.6.analog-stereo analog-output-headphones
	notify-send \
		"Audio Control" \
		"<b>Headphones</b> have been configured as audio output" \
		--expire-time=1200 \
		--icon=$headphones_icon
fi

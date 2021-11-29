#!/bin/bash

output=$(pacmd list | awk '{if(/active port:/) print $3}' | head -n 1)

echo $output

if [ "$output" = "<analog-output-headphones>" ]; then
	pacmd set-sink-port alsa_output.pci-0000_38_00.6.analog-stereo analog-output-lineout
	notify-send "Audio Control" "Line out have been configured as audio output" --expire-time=1200 # Miliseconds
elif [ "$output" = "<analog-output-lineout>" ]; then
	pacmd set-sink-port alsa_output.pci-0000_38_00.6.analog-stereo analog-output-headphones
	notify-send "Audio Control" "Headphones have been configured as audio output" --expire-time=1200 # Miliseconds
fi

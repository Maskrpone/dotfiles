#!/bin/bash

function raise {
	if (($1 + $2 > 150)); then
		echo "Error, volume would exceed 150% (actual volume is $actual_volume), arbitrary blocking"
	else
		pactl set-sink-volume @DEFAULT_SINK@ +$1%
	fi
}

function lower {
	pactl set-sink-volume @DEFAULT_SINK@ -$1%
}

function mute {
	pactl set-sink-volume @DEFAULT_SINK@ 0%
}

main() {
	local mode=$1                                                                                 # get wanted mode
	local actual_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/.$//') # retrieve actual volume

	# run the function corresponding to the wanted mode
	if [[ "$mode" == "raise" ]]; then
		raise "$2" "$actual_volume"
	elif [[ "$mode" == "lower" ]]; then
		lower "$2"
	elif [[ "$mode" == "mute" ]]; then
		mute
	fi
}

main "$@" # call main function with all parameters

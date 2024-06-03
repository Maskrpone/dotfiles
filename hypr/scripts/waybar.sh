#!/usr/bin/env bash

if ps -e | grep 'waybar' > /dev/null; then
    killall -q waybar
fi

waybar &

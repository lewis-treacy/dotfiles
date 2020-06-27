#!/bin/bash

echo "Killing current bars..."
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

echo "Launching desktop bars..."
polybar primary -c $HOME/.config/polybar/config &
polybar left -c $HOME/.config/polybar/config &
polybar right -c $HOME/.config/polybar/config &

echo "Bars launched..."

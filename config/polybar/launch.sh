#!/bin/bash

echo "Killing current bars..."
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

echo "Launching laptop bars..."
polybar bar -c $HOME/.config/polybar/config &

echo "Bars launched..."

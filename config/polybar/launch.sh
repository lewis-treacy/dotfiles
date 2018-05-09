#!/bin/bash

echo "Killing current bars..."
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

if [[ $(hostname) == "lewisDesktop" ]]; then
  echo "Launching desktop bars..."
  polybar bar1 -c $HOME/.config/polybar/config_desktop &
  polybar bar2 -c $HOME/.config/polybar/config_desktop &
elif [[ $(hostname) == "lewisLaptop" ]]; then
  echo "Launching laptop bars..."
  polybar bar3 -c $HOME/.config/polybar/config_laptop &
fi

echo "Bars launched..."

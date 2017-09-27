#! /usr/bin/env sh

echo "Killing current bars..."
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

if [[ $(hostname) == "GLaDOS" ]]; then
  echo "Launcing desktop bars..."
  polybar bar1 -c $HOME/.config/polybar/config_desktop &
  polybar bar2 -c $HOME/.config/polybar/config_desktop &
  # polybar temp -c $HOME/.config/polybar/config_desktop &
elif [[ $(hostname) == "wheatley" ]]; then
  echo "Launcing laptop bars..."
  polybar bar3 -c $HOME/.config/polybar/config_laptop &
fi

echo "Bars launched..."

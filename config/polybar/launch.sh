#!/bin/bash

echo "Killing current bars..."
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done

# <launch computer specific bars>

echo "Bars launched..."

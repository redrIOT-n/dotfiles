#!/usr/bin/env bash

# Terminate already running bar instances
#killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/example.log
#polybar bottom >>/tmp/polybar1.log 2>&1 & disown
polybar top 2>&1 --config=/home/rxored/.config/polybar/onedark/config.ini | tee -a /tmp/example.log & disown
echo "Bars launched..."

#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
echo "---" | tee -a /tmp/example.log
polybar up 2>&1 --config=/home/rxored/.config/polybar/openbox/config.ini | tee -a /tmp/example.log & disown

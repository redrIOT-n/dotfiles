#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/example.log

#polybar black 2>&1 --config=/home/rxored/.config/polybar/nv/config.ini | tee -a /tmp/example.log & disown
polybar example  2>&1 --config=/home/rxored/.config/polybar/nv/config.ini | tee -a /tmp/example.log & disown
echo "Bars launched..."


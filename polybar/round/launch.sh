#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
echo "---" | tee -a /tmp/example.log
polybar bottom-left 2>&1  --config=/home/rxored/.config/polybar/round/config.ini | tee -a /tmp/example.log & disown
polybar bottom-right 2>&1  --config=/home/rxored/.config/polybar/round/config.ini | tee -a /tmp/example.log & disown

polybar left 2>&1  --config=/home/rxored/.config/polybar/round/config.ini | tee -a /tmp/example.log & disown
polybar right 2>&1  --config=/home/rxored/.config/polybar/round/config.ini | tee -a /tmp/example.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

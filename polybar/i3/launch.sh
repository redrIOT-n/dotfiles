killall -q polybar

echo "---" | tee -a /tmp/example.log
polybar main 2>&1 --config=/home/rxored/.config/polybar/i3/config | tee -a /tmp/example.log & disown



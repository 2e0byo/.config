# Defined in /tmp/fish.0bNByt/countdown.fish @ line 2
function countdown
	fish -c "countdown.py $argv; and notify-send 'Countdown Elapsed!'; and ding"
end

# Defined in /tmp/fish.WwZ1Hq/brightness.fish @ line 1
function brightness
	for screen in (xrandr | grep connected | awk '{print $1}')
	xrandr --output $screen --brightness $argv[1]
    end
end

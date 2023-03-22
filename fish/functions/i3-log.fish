# Defined in - @ line 1
function i3-log --description 'alias i3-log env DISPLAY=:0 i3-dump-log'
	env DISPLAY=:0 i3-dump-log $argv;
end

function swap
	echo 'toggling swap....'; and sudo swapoff -a; and sudo swapon -a; and echo 'success!'; or echo 'failure!' $argv;
end

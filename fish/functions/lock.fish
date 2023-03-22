function lock --description 'alias lock=xset dpms force off; and i3lock -i ~/lock.png -t'
    swaylock -i ~/lock.png -t $argv
end

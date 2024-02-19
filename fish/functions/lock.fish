function lock
    hyprctl dispatch dpms off
    swaylock -i ~/lock.png -t
end

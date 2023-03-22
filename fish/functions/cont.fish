function cont
    pkill -sigcont xinit
    pkill -sigcont i3
    pkill -sigcont dropbox -f
    pkill -sigcont xss-lock
    pkill -sigcont redshift
    pkill -sigcont -f udiskie
    pkill -sigcont unclutter
end

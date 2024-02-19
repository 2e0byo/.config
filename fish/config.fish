function tryadd
   if [ -d $argv[1] ]
      set -gx PATH $argv[1] $PATH
   end
end
# $PATH
tryadd ~/bin
tryadd ~/bin/scripts
tryadd ~/Library/Music/psalms
tryadd ~/.local/bin
tryadd ~/bin/ponymix
tryadd ~/.npm-global/bin
tryadd /opt/microchip/xc8/v2.30/bin
tryadd ~/.gem/ruby/3.0.0/bin
tryadd ~/.cargo/bin
tryadd ~/go/bin


# terminal, for tmux
#set -gx TERM xterm-256color

# for java apps
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

status --is-interactive; or exit #extra output confuses if not

if [ -f /usr/bin/tmux ]; and [ -z "$TMUX" ]; and [ "$SSH_CONNECTION" != "" ]
    tmux attach-session -t ssh_tmux; or tmux new-session -s ssh_tmux
end

# graphics
if [ -f "$HOME/Pictures/2017/serbia/micycle.txt" ]
    cat "$HOME/Pictures/2017/serbia/micycle.txt"
end
set -g theme_color_scheme solarized-dark
set -g theme_nerd_fonts yes
starship init fish | source

if [ $SSH_CONNECTION ]
    export PINENTRY_USER_DATA=USE_CURSES
    export GPG_TTY=$(tty)
end

eval (dircolors -c ~/.config/dircolors/dircolors)

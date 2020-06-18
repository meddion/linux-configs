# Sources .bashrc
[[ $BASH_VERSION ]] && [[ -e "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
# Sets PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH" 
# Sets PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
# Manages tmp dir at home
mkdir -p "$HOME/tmp"
[[ "`ls -A "$HOME/tmp"`" != "" ]] && rm -rf "$HOME"/tmp/*
# Turns of the bell
# setterm -blength 0
# Some handy variables
export CONFIG="$HOME/.config"
export XDG_DATA_HOME=$CONFIG
export MYVIMRC_DIR="$XDG_DATA_HOME"/nvim
export MYVIMRC="$MYVIMRC_DIR"/init.vim
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"
export TERMINAL="alacritty"

if [[ "`tty`" = "/dev/tty1" ]]; then
    pgrep i3 || startx
fi

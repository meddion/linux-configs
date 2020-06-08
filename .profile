# Sources .bashrc
[[ -n $BASH_VERSION ]] && [[ -f "~/.bashrc" ]] && . "~/.bashrc"
# Sets PATH so it includes user's private bin if it exists
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH" 
# Sets PATH so it includes user's private bin if it exists
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# Manages tmp dir at home
mkdir -p "$HOME"/tmp
[[ -n "$(ls -A "$HOME"/tmp)" ]] && rm -rf "$HOME"/tmp/*

# Some handy variables
export XDG_DATA_HOME="$HOME"/.config
export MYVIMRC_DIR="$XDG_DATA_HOME"/nvim
export MYVIMRC="$MYVIMRC_DIR"/init.vim
export CONFIG="$HOME/.config"
export EDITOR="nvim"
export VISUAL="nvim"
alias vi="nvim"

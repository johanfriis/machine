############
### MISC ###
############

# When no arguments are provided to "." or "source", they default to
# sourcing .zshrc. Based on [1], thanks @PythonNut!
#
# [1]: http://unix.stackexchange.com/a/326948/176805
function _accept-line() {
    emulate -LR zsh
    if [[ $BUFFER == "." ]]; then
        BUFFER=". ~/.zshrc"
    elif [[ $BUFFER == "source" ]]; then
        BUFFER="source ~/.zshrc"
    fi
    zle .accept-line
}
zle -N accept-line _accept-line

# move files written to $HOME if we can
if [[ -d "$HOME/.tmp" ]]; then
  export LESSHISTFILE="$HOME/.tmp/lesshst"
fi

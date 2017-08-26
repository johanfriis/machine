################
### COMMANDS ###
################

######################################################################
#### Tmux

if (( $+commands[tmux] )); then
    alias ta='tmux attach'
    alias tt='tmux attach -t'
    alias ts='tmux new-session -s'
    alias tl='tmux list-session'
fi

######################################################################
#### Tmuxinator

if (( $+commands[tmuxinator] )); then
    alias mux=tmuxinator
fi

######################################################################
#### Emacs

if (( $+commands[emacs] )); then
    alias emacs='emacs -nw'
    alias e='emacs'
    alias eq='emacs -Q'
fi

if (( $+commands[emacsclient] )); then
    alias ec='emacsclient --alternate-editor= -nw'
fi

######################################################################
#### Vim

if (( $+commands[nvim] )); then
    alias v='nvim'
elif (( $+commands[vim] )); then
    alias v='vim'
elif (( $+commands[vi] )); then
    alias v='vi'
fi

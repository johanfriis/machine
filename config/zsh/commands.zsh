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

######################################################################
#### FASD

if (( $+commands[fasd] )); then
  eval "$(fasd --init auto)"
  alias j=z
fi

######################################################################
#### FD
#### https://github.com/sharkdp/fd

if (( $+commands[fd] )); then
  alias find="fd"
fi

######################################################################
#### EXA
#### https://github.com/ogham/exa

if (( $+commands[exa] )); then
  alias l='exa --all --header --long --color-scale'
  alias lg='exa --all --grid --header --long --color-scale'
  alias lt='exa --all --header --long --tree --color-scale --ignore-glob .git'
  function lti() {
    emulate -LR zsh
    exa --all --header --long --tree --color-scale --ignore-glob ".git|$1" ${@:2}
  }
  alias ltl='exa --all --header --long --tree --color-scale --ignore-glob .git --level'
  function ltli() {
    emulate -LR zsh
    exa --all --header --long --tree --color-scale --level $1 --ignore-glob ".git|$2" ${@:3}
  }
fi

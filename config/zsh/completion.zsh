##################
### COMPLETION ###
##################

## load homebrew completion files
if type brew &>/dev/null; then
  fpath=(/usr/local/share/zsh-completions $fpath)
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

## autoload compinit, but place it's cache
## file in our .tmp file if it exists
autoload -U compinit
if [[ -d "$HOME/.tmp" ]]; then
 compinit -i -d "$HOME/.tmp/zcompdump"
else
 compinit -i
fi

# For ambiguous completions, use an interactive menu (which can be
# escaped with C-g) instead of overwriting the current command.
zstyle ':completion:*' menu select=2

# Allow usage of shift-tab (backtab) to go backward in the completion
# menu.
bindkey '^[[Z' reverse-menu-complete

# Substring completions. Not fuzzy. Sometimes they have weird working on
# completions literally all day. See [1]. (Why is zsh so hard? Sigh.)
#
# [1]: http://unix.stackexchange.com/q/330481/176805
#zstyle ':completion:*' matcher-list 'l:|=* r:|=* m:{a-z\-}={A-Z\_}'

# allow completion of . and ..
zstyle ':completion:*' special-dirs true

COMPLETION_COLORS='ma=01;32:no=1;1:di=1;1'
zstyle ':completion:*' list-colors ${(s.:.)COMPLETION_COLORS}

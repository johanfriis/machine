##################
### COMPLETION ###
##################

## autoload compinit, but place it's cache
## file in our .tmp file if it exists
autoload -U compinit
compinit -i
## at the moment this is not working, so disable
#if [[ -d "$HOME/.tmp" ]]; then
#  compinit -i -d "$HOME/.tmp/zcompdump"
#else
#  compinit -i
#fi

# For ambiguous completions, use an interactive menu (which can be
# escaped with C-g) instead of overwriting the current command.
zstyle ':completion:*' menu select

# Allow usage of shift-tab (backtab) to go backward in the completion
# menu.
bindkey '^[[Z' reverse-menu-complete

# Substring completions. Not fuzzy. Sometimes they have weird working on
# completions literally all day. See [1]. (Why is zsh so hard? Sigh.)
#
# [1]: http://unix.stackexchange.com/q/330481/176805
zstyle ':completion:*' matcher-list 'l:|=* r:|=* m:{a-z\-}={A-Z\_}'

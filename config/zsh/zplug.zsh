#############
### ZPLUG ###
#############

#### Define default bundle list

bundles=(
    # Quickly jump to directories:
    "mfaerevaag/wd, use:wd.sh, rename-to:wd, as:command"
    # Display autosuggestions from history:
    "zsh-users/zsh-autosuggestions"
    # Completion definitions for lots of additional commands.
    "zsh-users/zsh-completions"
)

#############################################################
#### Define bundle list management functions

# Usage: add_bundle <zplug-args>
#
# Adds a bundle to $bundles. Word splitting will be performed on
# zplug-args to determine the arguments that will be passed to zplug.
function add_bundle() {
    emulate -LR zsh
    if ! (( ${bundles[(I)$1]} )); then
        bundles+=($1)
    fi
}

# Usage: remove_bundle <zplug-args>
#
# Removes a bundle from $bundles by name. The name should be exactly
# the same as it appears in $bundles, with spaces if necessary.
function remove_bundle() {
    emulate -LR zsh
    bundles=("${(@)bundles:#$1}")
}

#############################################################
#### Load local customizations

if [[ -f ~/.zsh/zplug.local.zsh ]]; then
    . ~/.zsh/zplug.local.zsh
fi

#############################################################
#### init zplug

# Install zplug:
# $ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
export ZPLUG_HOME=/usr/local/opt/zplug
export ZSH_CACHE_DIR=$ZSH/cache

if [[ -o login && -f $ZPLUG_HOME/init.zsh ]]; then
    . $ZPLUG_HOME/init.zsh

    for bundle in $bundles; do
        zplug $=bundle
    done

    if ! zplug check; then
        zplug install
    fi

    zplug load
fi


##################
### FILESYSTEM ###
##################

# You can cd to a directory just by typing its name; no need to
# preface it with cd.
setopt autocd

# This makes it so that when you cd to a new directory, the old
# directory is saved in the directory stack (view with dirs or ds).
setopt autopushd

# This makes it so that "cd -n" gives you the directory you were in n
# cd's ago, instead of the nth directory you have visited in the shell
# session. (You can use "cd +n" to recover the latter behavior.)
setopt pushdminus

# This makes it so that the working directory path is automatically
# fully resolved. This means that symlink components will be followed,
# and capitalization will be corrected if you are on a
# case-insensitive filesystem.
setopt chaselinks

# Better ls defaults.
## -1 : one file per line
## -p : --indicator-style=slash
## -G : --no-group
## -g : --group-directories-first
## -h : --human-readable
## -a : --all
## -A : --almost-all
## -F : --classify

alias ls="ls --color=always --group-directories-first"
alias ll="ls -1pF"
alias lls="ls -lhGp"
alias lla="ls -AlhGFp"
alias llla="ls -alhFp"

# These are global aliases; you can use them anywhere in a command.
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'
alias .......='../../../../../..'
alias ........='../../../../../../..'
alias .........='../../../../../../../..'
alias ..........='../../../../../../../../..'

# These are some aliases for moving to previously visited directories.
# The first alias uses "--" so that we can alias "-" without it being
# interpreted as a flag for the alias command.
alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# To complement the previous set of aliases, here is a convenient way
# to list the last few directories visited, with their numbers. The
# alias "d", which is used by oh-my-zsh for this purpose, is taken
# from fasd, so instead I chose a different convenient abbreviation of
# "dirs".
alias ds='dirs -v | head -10'

# These aliases are for interacting with directories on the
# filesystem.
alias md='mkdir -p'
alias rd='rmdir'
function mcd() {
    emulate -LR zsh
    mkdir -p $@
    cd ${@[$#]}
}

# You can "copy" any number of files, then "paste", "move" or
# "pasteln" them to pass them as arguments to cp, mv, or ln
# respectively. Just like a graphical filesystem manager. Each of the
# latter three functions defaults to the current directory as the
# destination.
function copy() {
    emulate -LR zsh
    shell_clipboard=()
    for target; do
        shell_clipboard+=(${target:a})
    done
}
function paste() {
    emulate -LR zsh
    cp -R $shell_clipboard ${1:-.}
}
function move() {
    emulate -LR zsh
    mv $shell_clipboard ${1:-.}
}
function pasteln() {
    emulate -LR zsh
    ln -s $shell_clipboard ${1:-.}
}

# This function takes a symlink, resolves it, and replaces it with a
# copy of whatever it points to.
function delink() {
    emulate -LR zsh
    if [[ -z $1 ]]; then
        echo "usage: delink <symlinks>"
        return 1
    fi
    for link; do
        if [[ -L $link ]]; then
            if [[ -e $link ]]; then
                target=${link:A}
                if rm $link; then
                    if cp -R $target $link; then
                        echo "Copied $target to $link"
                    else
                        ln -s $target $link
                    fi
                fi
            else
                echo "Broken symlink: $link"
            fi
        else
            echo "Not a symlink: $link"
        fi
    done
}

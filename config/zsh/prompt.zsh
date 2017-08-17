##############
### PROMPT ###
##############

# Enable parameter expansion and other substitutions in the $PROMPT.
setopt prompt_subst

# Load some arrays that give us convenient access to color-changing
# escape codes.
autoload -U colors && colors

# Here we define a prompt that displays the current directory and git
# branch, and turns red on a nonzero exit code. Adapted heavily from
# [1], with supporting functions extracted from Oh My Zsh [2] so that
# we don't have to load the latter as a dependency.
#
# [1]: https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/mgutz.zsh-theme
# [2]: https://github.com/robbyrussell/oh-my-zsh/blob/3705d47bb3f3229234cba992320eadc97a221caf/lib/git.zsh

if (( $+commands[git] )); then

    # Function that prints the branch or revision of the current HEAD,
    # surrounded by square brackets and followed by an asterisk if the
    # working directory is dirty, if the user is inside a Git repository.
    function prompt_git_info() {
        emulate -LR zsh
        local ref
        ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
            ref=$(command git rev-parse --short HEAD 2> /dev/null) || \
            return 0
        echo "[${ref#refs/heads/}$(prompt_git_dirty)]"
    }

    # Function that prints an asterisk if the working directory is dirty.
    # If $PROMPT_IGNORE_UNTRACKED_FILES is true, then untracked
    # files are not counted as dirty.
    function prompt_git_dirty() {
        emulate -LR zsh
        local FLAGS
        FLAGS=('--porcelain' '--ignore-submodules=dirty')
        if [[ $PROMPT_IGNORE_UNTRACKED_FILES == true ]]; then
            FLAGS+='--untracked-files=no'
        fi
        if [[ $(command git status ${FLAGS} 2> /dev/null | tail -n1) ]]; then
            echo "*"
        fi
    }

    # Define the actual prompt format.
    PROMPT='%(?.%{$fg[blue]%}.%{$fg[red]%})%c%{$reset_color%}$(prompt_git_info)%(?.%{$fg[blue]%}.%{$fg[red]%}) %# %{$reset_color%}'

else

    # Backup prompt for if the user doesn't have Git.
    PROMPT='%(?.%{$fg[blue]%}.%{$fg[red]%})%c%(?.%{$fg[blue]%}.%{$fg[red]%}) %# %{$reset_color%}'

fi


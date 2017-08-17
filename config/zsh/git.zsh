###########
### GIT ###
###########

if (( $+commands[git] )); then
    alias g=git

    alias gh='git help'

    alias gi='git init'

    alias gst='git status'

    alias gsh='git show'
    alias gshs='git show --stat'

    alias gl='git log --graph --decorate'
    alias gls='git log --graph --decorate --stat'
    alias glp='git log --graph --decorate --patch'
    alias glps='git log --graph --decorate --patch --stat'
    alias glo='git log --graph --decorate --oneline'
    alias gla='git log --graph --decorate --all'
    alias glas='git log --graph --decorate --all --stat'
    alias glap='git log --graph --decorate --all --patch'
    alias glaps='git log --graph --decorate --all --patch --stat'
    alias glao='git log --graph --decorate --all --oneline'
    function glg {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgs {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgp {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgps {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgo {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glga {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --all ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --all --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgpa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --all --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgpsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --all --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glgoa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log --grep=$1 --graph --decorate --all --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glS {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSs {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSp {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSps {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSo {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --all ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --all --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSpa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --all --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSpsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --all --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glSoa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -S $1 --graph --decorate --all --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glG {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGs {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGp {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGps {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGo {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --all ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --all --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGpa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --all --patch ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGpsa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --all --patch --stat ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }
    function glGoa {
        emulate -LR zsh
        if (( $# >= 1 )); then
            git log -G $1 --graph --decorate --all --oneline ${@:2}
        else
            echo "No query provided."
            return 1
        fi
    }

    alias ga='git add'
    alias gap='git add --patch'
    alias gaa='git add --all'

    alias grm='git rm'

    alias gmv='git mv'

    alias gr='git reset'
    alias grs='git reset --soft'
    alias grh='git reset --hard'
    alias grp='git reset --patch'

    alias gc='git commit --verbose'
    alias gca='git commit --verbose --amend'
    alias gcaa='git commit --verbose --amend --all'
    alias gcf='git commit -C HEAD --amend'
    alias gcfa='git commit -C HEAD --amend --all'
    alias gce='git commit --verbose --allow-empty'
    alias gcm='git commit -m'
    alias gcma='git commit --all -m'
    alias gcam='git commit --amend -m'
    alias gcama='git commit --amend --all -m'
    alias gcem='git commit --allow-empty -m'

    alias gcp='git cherry-pick'
    alias gcpc='git cherry-pick --continue'
    alias gcpa='git cherry-pick --abort'

    alias grv='git revert'
    alias grvm='git revert -m'

    alias gt='git tag'
    alias gtd='git tag -d'

    alias gn='git notes'
    alias gna='git notes add'
    alias gne='git notes edit'
    alias gnr='git notes remove'

    alias gsta='git stash save'
    alias gstau='git stash save --include-untracked'
    alias gstap='git stash save --patch'
    alias gstl='git stash list'
    alias gsts='git stash show --text'
    alias gstss='git stash show --stat'
    alias gstaa='git stash apply'
    alias gstp='git stash pop'
    alias gstd='git stash drop'

    alias gd='git diff'
    alias gds='git diff --stat'
    alias gdc='git diff --cached'
    alias gdcs='git diff --cached --stat'

    alias gbl='git blame'

    alias gb='git branch'
    alias gbsu='git branch --set-upstream-to'
    alias gbusu='git branch --unset-upstream'
    alias gbd='git branch --delete'
    alias gbdd='git branch --delete --force'

    alias gco='git checkout'
    alias gcop='git checkout --patch'
    alias gcob='git checkout -B'

    alias glsf='git ls-files'

    alias gx='git clean'

    alias gbs='git bisect'
    alias gbss='git bisect start'
    alias gbsg='git bisect good'
    alias gbsb='git bisect bad'
    alias gbsr='git bisect reset'

    alias gm='git merge'
    alias gma='git merge --abort'

    alias grb='git rebase'
    alias grbi='git rebase --interactive'
    alias grbc='git rebase --continue'
    alias grbs='git rebase --skip'
    alias grba='git rebase --abort'

    alias gsm='git submodule'
    alias gsma='git submodule add'
    alias gsms='git submodule status'
    alias gsmi='git submodule init'
    alias gsmd='git submodule deinit'
    alias gsmu='git submodule update'
    alias gsmf='git submodule foreach'
    alias gsmy='git submodule sync'

    alias gcl='git clone --recursive'

    alias gre='git remote'
    alias grel='git remote list'
    alias gres='git remote show'

    alias gf='git fetch --prune'
    alias gfa='git fetch --all --prune'

    alias gu='git pull'
    alias gur='git pull --rebase'
    alias gum='git pull --no-rebase'

    alias gp='git push'
    alias gpa='git push --all'
    alias gpf='git push --force-with-lease'
    alias gpff='git push --force'
    alias gpu='git push --set-upstream'
    alias gpd='git push --delete'
fi

###########
### HUB ###
###########

# This extends Git to work especially well with Github. See [1] for
# more information.
#
# [1]: https://github.com/github/hub
if (( $+commands[hub] )); then
    alias hcl='hub clone --recursive'
    alias hc='hub create --copy'
    alias hcp='hub create -p --copy'
    alias hf='hub fork'
    alias hp='hub pull-request --copy'
    alias hb='hub browse'
    alias hh='hub help'
    alias hi='hub issue'
fi


###############
### HISTORY ###
###############

# Never discard history within a session, or at least not before any
# reasonable amount of time.
export HISTSIZE=1000000

# Save history to disk.
if [[ -d "$HOME/.tmp" ]]; then
  export HISTFILE="$HOME/.tmp/zsh_history"
else
  export HISTFILE="$HOME/.zsh_history"
fi

# Never discard history in the file on disk, either.
export SAVEHIST=1000000

# Don't save commands to the history if they start with a leading
# space. This is useful if you have to pass a password as a parameter
# to a command.
setopt hist_ignore_space

# All zsh sessions share the same history file. Timestamps are also
# recorded for each command.
setopt append_history
#setopt share_history
setopt noshare_history
setopt noextendedhistory

# Use OS-provided locking mechanisms for the history file, if
# available. The manual says this might improve performance and
# decrease the chance of corruption.
setopt hist_fcntl_lock

# Remove superfluous whitespace when saving commands to the history.
setopt hist_reduce_blanks

# When history expansion is used (e.g. sudo !!), do the expansion
# instead of executing the command immediately. (Of course, the above
# use case is better serviced by just pressing ESC twice.)
setopt hist_verify

# When saving commands, ignore duplicates, and if a duplicate
# entry is set to be added, remove the previous instance. This
# keeps out history of commands fresh

# When trimming history file, remove duplicates first.
setopt hist_expire_dups_first

# Don't add a command to history if the previous one was the same
setopt hist_ignore_dups 

# This will remove all duplicates from the list starting with the
# oldest. We don't want this as it will give an incomplete picture
# of the commands being used and their sequence
setopt hist_ignore_all_dups
setopt hist_save_no_dups

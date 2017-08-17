###############
### OPTIONS ###
###############

# Allow comments even in the interactive shell (start with #).
setopt interactive_comments

# Turn off flow control (which makes it so that ctrl+s and ctrl+q
# freeze and unfreeze command output, respectively).
unsetopt flow_control

#### Globbing

# This makes globs case-insensitive.
unsetopt case_glob

# This makes globbing regexes case-insensitive.
unsetopt case_match

# Allow globs to match dotfiles.
setopt glob_dots

# Sort numeric filenames numerically, instead of lexicographically.
setopt numeric_glob_sort


#!/usr/bin/env bash
###########
# History #
###########

# Maximum number of entries in the history-files
export HISTFILESIZE=20000

# Maximum number of the entries in the history accessible from the tty
export HISTSIZE=10000

# Ignore duplicates and erase them, ignore commands starting with a space
export HISTCONTROL=ignorespace,ignoredups,erasedups

# Add timestamps
export HISTTIMEFORMAT="%F %T "

# don't save in history
export HISTIGNORE="&:ls:[bf]g:exit:history -d*"


###############
# Other Stuff #
###############

# default editor
export EDITOR=nano

# which paths to check for directory to cd into, divided by : empty string means current directory
export CDPATH=:..:~:~/Develop/:/


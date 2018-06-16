#!/usr/bin/env bash

# executed after each command
function prompt_command_fn() {
    # append current session to history
    history -a

    if [ $1 -eq 0 ]; then # last command returned 0
        # green tick
        /usr/bin/printf "\033[0;32m\xE2\x9C\x94\033[0m "
    else
        # show errorcode
        /usr/bin/printf "\033[0;31mERROR $1\n\n\xe2\x9c\x96\033[0m "
        # remove last entry from history
        sed -i '$ d' ~/.bash_history
    fi
}
export PROMPT_COMMAND='prompt_command_fn $?'

# HH:MM:SS USER@HOST:/current/work/dir$
export PS1="\[$(tput sgr0)\]\[\033[38;5;5m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;46m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;87m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\]";

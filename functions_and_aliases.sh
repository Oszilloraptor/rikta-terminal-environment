#!/usr/bin/env bash 


##############
# ls-aliases #
##############
##
# --almost-all      = show all files, don't show . and ..
# --color=auto      = shows colors, if supported
# --classify        = appends an indicator after items, like / after directories and * after executables
# --human-readable  = human-readable sizes
# -l                = shows it in list-format
# --recursive       = repeat for all subdirectories

# just a nice ls with all common options
alias ll="ls --almost-all --color=auto --classify --human-readable -l"
# like ll, but recurive
alias lr="ls --almost-all --color=auto --classify --human-readable -l --recursive"
# like ll, but shows only directories
alias ld="ls --almost-all --color=auto --classify --human-readable -l | grep -P '/$' --color=never"
# like ll, but shows only directories and recurses
alias ldr="ls --almost-all --color=auto --classify --human-readable -l --recursive | grep -P '/$' --color=never"

##############
# cd-aliases #
##############

# moving into parent directories
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"



#########
# utils #
#########

# searches the history for a command
# it is handy in combination with !<history-number> ;)
alias hg="history | grep" #<search term>

# [OVERRIDE]
# overrides the behavior of nano
# --backup        = create a backup of each file
# --tabstospaces  = use spaces instead of tabs
# --smooth        = scroll line-wise instead of half-pages
# --tabsize=4     = set the size of a tab to 4 spaces
# --constatshow   = always show the cursos position (not availaible on uberspace 7)
# --autoindent    = enable automatic indentation
# --mouse         = enable mouse-support
alias nano="nano --backup --tabstospaces --smooth --tabsize=4 --autoindent --mouse"

# google stuff
alias google="googler"

# executes the last command as sudo
alias please='sudo $(fc -ln -1)'

# ping google-dns server to check if you have a connection outwards
alias 8888="ping 8.8.8.8"

# shows a nice in-terminal forecast for berlin
alias weather="curl wttr.in/berlin"

# shows all ips your pc has at the moment
alias ips="ifconfig -a | perl -nle'/(\\d+\\.\\d+\\.\\d+\\.\\d+)/ && print'"

# shows the names of the contributors of a git-repository
alias contributors="git log --format='%aN' | uniq -u"

# performs a softreboot with skipping hardwarechecks
alias softreboot="sudo /sbin/kexec -l /boot/$KERNEL --append=\"$KERNELPARAMTERS\" --initrd=/boot/$INITRD; sync; sudo /sbin/kexec -e"

# show whole post in howdoi
alias howdoi="howdoi -a"



##############
# filesystem #
##############

# creates a directory (and parent directories if needed) and cd's into it
function mkcd () { #<dirpath>
    mkdir $1 -p
    cd $1 || return
}

# moves a file, if second parameter is a directory cd into the directory (instead of a filename)
function mvcd() { #<source-dir> <target-dir>
    if [ -d "$2" ]
    then
        mv $1 $2 && cd $2 || return
    else
        mv $1 $2
    fi
}

# create a copy of a file/directory with appended .backup
function backup() { #<filename>
    cp $1{,.backup};
}

# [OVERRIDE]
# overrides the behavior of mkdir
# it creates parent-directories if necessary and reports every directory created
alias mkdir="mkdir --parents --verbose"

# [OVERRIDE]
# overrides the behavior of rm
# it now works recursive and removes empty dirs
alias rm="rm --dir --recursive --verbose" #(<- use this if you don't want to use the trash)

# makes a file immutable, even root can't mutate it (without executing the mutable-command beforehand)
alias immutable="sudo chattr +i" #<filename>

# makes it mutable again
alias mutable="sudo chattr -i" #<filename>

# replaces all spaces in the filenames of the cwd with underscores
alias underscore="rename 'y/ /_/' *" # replaces all spaces in filenames in the cwd with underscores

# shows recent modified files in this dir and subdirectories sorted by last modification date
alias recent="find . -type f -printf '%TY-%Tm-%Td %TT %p\n' | sort"

# recursively remove all empty directories
alias rme="find . -type d -empty -delete"

# show public ssh-key
alias pubkey="cat ~/.ssh/id_rsa.pub"

# [OVERRIDE]
# replaces tree with alder
alias tree="alder"

# removes backups in current file
alias rmbu="rm -iv ./*{~,.save}"

###########
# network #
###########

# serves one file (and only one!) on port 80
function serve() { #<filename>
    while true ; do sudo nc -l 80 < $1 ; done
}

# ping an ip every 10 seconds and ring the alert-bell when it responds
alias online="ping -i 10 -a" #<ip_address>

# show the names of all processes that are connected to the internet
alias connected="lsof -P -i -n | cut -f 1 -d \" \"| uniq | tail -n +2"

# [OVERRIDE]
# overrides the behavior of wget
# it now continues on connection-errors
alias wget="wget -c"



###############
# other stuff #
###############

# this stuff is not necessarily usefull for everyone

# text-to-speech for every installed language
function say() { #<language> <text ...>
 echo "${*:2}" | espeak -v $1 -s 140
}

# [OVERRIDE]
# overrides the make-command
# it now uses all 4 cores
alias make="make -j 4" # use all core for compiling

# shows the 30 most used commands, sorted by usage
function mostUsedCommands() {
    history \
    | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' \
    | grep -v "./" \
    | column -c3 -s " " -t \
    | sort -nr \
    | nl \
    | head -n30
}

# get "bofh-excuses"
function bofh() {
    telnet towel.blinkenlights.nl 666 \
    | sed "s/=== The BOFH Excuse Server ===//" \
    | tr -d '\n' \
    && echo
}

# commit with a random message
# don't use this at work ;)
alias rancommit="git commit -m \"\$(curl -s http://whatthecommit.com/index.txt)\"" # commits with a random commit message

# shows all executable commands
alias all="compgen -c | sort -u" # shows all commands

# shows the content of the ram
alias ram="sudo cat /dev/mem | hexdump -C | less"

# reloads bashrc
alias reload=". ~/.bashrc"

# clocks into moro (npm tool for timetracking)
alias hi="moro hi"

# clocks out of moro and shutdown
alias bye="moro bye"

# prints the state of the last command with a stegosaurus or a daemon, depending
# on exit code
#
# usefull to end a long-running command where you may leave your pc and look
# to the screen from the other side of the room for a while
function report() {
    if [ $? -eq 0 ]; then # last command returned 0
		clear
       	cowsay -f stegosaurus "run successfully :)"
    else
       	cowsay -f daemon "command failed o:"
    fi
}

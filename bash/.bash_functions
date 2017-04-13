#!/usr/bin/env sh
# ~/.bash_functions

mans () { man "$1" | grep -iC2 --color=always "$2" | less -FSRXc; }
showa () { /usr/bin/grep --color=always -i -a1 "$@" ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }
mcd () { mkdir -p "$1" && cd "$1" || exit; }        # mcd:          Makes new Dir and jumps inside
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" 2>&1 /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
dcc() { docker-compose "$@"; }
sha1base64() { echo "$1" | openssl sha1 -binary | base64; }
scheck() { shellcheck -x -e SC1091 -e SC2039 --color=always -s sh "$1"; }
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$*"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$*" ; }  # ffe:      Find file whose name ends with a given string
my_ps() { ps "$@" -u "$USER" -o pid,%cpu,%mem,start,time,bsdtime,command ; }
zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex

        #       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }
#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
spotlight () { mdfind "kMDItemDisplayName == $*wc"; }

# Docker
dockercleancontainers() { docker container prune; }
dockercleanimages() { docker image prune --all; }
dockerclean() { dockercleancontainers && dockercleanimages; }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f "$1" ] ; then
        case $1 in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)     gettext "'$1' cannot be extracted via extract()" ;;
        esac
    else
        gettext "'$1' is not a valid file"
    fi
}


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    gettext -e "\nYou are logged on ${RED}$HOST"
    gettext -e "\nAdditionnal information:$NC " ; uname -a
    gettext -e "\n${RED}Users logged on:$NC " ; w -h
    gettext -e "\n${RED}Current date :$NC " ; date
    gettext -e "\n${RED}Machine stats :$NC " ; uptime
    gettext -e "\n${RED}Current network location :$NC " ; scselect
    gettext -e "\n${RED}Public facing IP Address :$NC " ;myip
        #gettext -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    gettext
}

code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code" -n
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" -n --args "$F"
    fi
}

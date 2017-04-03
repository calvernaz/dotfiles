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
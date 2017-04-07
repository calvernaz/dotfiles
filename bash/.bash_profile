#!/usr/bin/env sh
# ~/.bash_profile

[[ -s ~/.bashrc ]] && . ~/.bashrc
[[ -s ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -s ~/.bash_functions ]] && . ~/.bash_functions
[[ -s ~/.git-prompt.sh ]] && . ~/.git-prompt.sh

prompt() {
	RED="\[\033[0;31m\]"
	GREEN="\[\033[0;32m\]"
	GREENBOLD="\[\033[1;32m\]"
	BLUE="\[\033[0;34m\]"
	PURPLE="\[\033[0;35m\]"
	RESETCOLOR="\[\e[00m\]"
	PS1="\n$BLUE\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\$(__git_ps1)\n $BLUE[\#] → $RESETCOLOR"
	export PS2=" | → $RESETCOLOR"
}

prompt

#   Set Paths
#   ------------------------------------------------------------
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/bin/emacs

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

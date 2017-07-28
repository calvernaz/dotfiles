#!/usr/bin/env sh
# ~/.bash_profile

[[ -f "$(brew --prefix)/etc/bash_completion" ]] && source "$(brew --prefix)/etc/bash_completion"
[[ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]] && source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"

[[ -s ~/.bashrc ]] && . ~/.bashrc
[[ -s ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -s ~/.bash_functions ]] && . ~/.bash_functions

GIT_PROMPT_ONLY_IN_REPO=0 # Use the default prompt when not in a git repo.
GIT_PROMPT_FETCH_REMOTE_STATUS=0 # Avoid fetching remote status
GIT_PROMPT_SHOW_UPSTREAM=0 # Don't display upstream tracking branch
GIT_SHOW_UNTRACKED_FILES=no # Don't count untracked files (no, normal, all)

prompt() {
	RED="\[\033[0;31m\]"
	GREEN="\[\033[0;32m\]"
	GREENBOLD="\[\033[1;32m\]"
	BLUE="\[\033[0;34m\]"
	PURPLE="\[\033[0;35m\]"
	RESETCOLOR="\[\e[00m\]"
#	PS1="\n$BLUE\u $PURPLE@ $GREEN\w $RESETCOLOR$GREENBOLD\n $BLUE[\#] → $RESETCOLOR"
	export PS2=" | → $RESETCOLOR"
}

prompt

#   Set Paths
#   ------------------------------------------------------------
export PATH="$PATH"

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
export LSCOLORS=exfxcxdxbxegedabagacad
ssh-add -A 2>/dev/null

export HISTCONTROL=ignoreboth:erasedups
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

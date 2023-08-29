# dotfiles

Bunch of dot files I've been collecting and updating for MacOSX.

# Install

## fish

   brew install fish

## sh

This is how it gonna look in the end:

![bash](bash/bash.png?raw=true)

To get this thing working just link the bash related files to your home or use [stow](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow) (but I can't be bothered)
```sh
   ln -sf ~/dotfiles/bash/.bash_profile ~/.bash_profile
   ln -sf ~/dotfiles/bash/.bash_functions ~/.bash_functions
   ln -sf ~/dotfiles/bash/.bash_aliases ~/.bash_aliases
```

You'll need to configure `git`

## git

```sh
	ln -sf ~/dotfiles/git/.gitconfig ~/.gitconfig
```

Customize your email and username inside the `.gitconfig` file

# Requirements

    brew install exa
    brew install bash-completion
    brew install docker-completion
    brew install bash-git-prompt

## Emacs

To start emacs as daemon with systemd follow the instructions from ![here](https://www.emacswiki.org/emacs/EmacsAsDaemon).
In my case `emacs.service` file was in the directory `/usr/share/emacs/26.1/etc/`.

## Claude

	Copy claude to ~/.claude
	https://claude.ai/public/artifacts/e2725e41-cca5-48e5-9c15-6eab92012e75
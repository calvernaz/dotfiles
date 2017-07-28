# dotfiles

Bunch of dot files I've been collecting and updating for MacOSX.

# Install

## sh

This is how it gonna look in the end:

![bash](/bash/bash.jpg?raw=true)

To get this thing working just link the bash related files to your home
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

# Extras

Install bash completion

	brew install bash-completion
	brew install docker-completion
	brew install bash-git-prompt

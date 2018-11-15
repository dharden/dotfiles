#!/bin/bash

# Work Stuff

# http://broken-by.me/lazy-load-nvm/
nvm() {
	unset -f nvm
	export NVM_DIR=~/.nvm
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	nvm "$@"
}

node() {
	unset -f node
	export NVM_DIR=~/.nvm
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	node "$@"
}

npm() {
	unset -f npm
	export NVM_DIR=~/.nvm
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	npm "$@"
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/versions/3.6.5/bin:$PATH"

export PATH=$PATH:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin
export EDITOR='vi'
# The colors, Duke, the colors!
export GREP_COLOR='1;35'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
git config --global color.ui true
if commandexists rbenv; then eval "$(rbenv init -)"; fi

# http://broken-by.me/lazy-load-nvm/
nvm() {
	unset -f nvm
	export NVM_DIR=~/.nvm
  # shellcheck source=./../../.nvm/nvm.sh
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	nvm "$@"
}

node() {
	unset -f node
	export NVM_DIR=~/.nvm
  # shellcheck source=./../../.nvm/nvm.sh
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	node "$@"
}

npm() {
	unset -f npm
	export NVM_DIR=~/.nvm
  # shellcheck source=./../../.nvm/nvm.sh
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
	npm "$@"
}

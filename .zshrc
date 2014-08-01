source /apollo/env/envImprovement/var/zshrc
#Adding Eclipse bin to $PATH
export PATH=/apollo/env/eclipse-3.7/bin:$PATH
export EDITOR=vim
export P4EDITOR=vim
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode dircycle brew archlinux npm nyan lol)

source $ZSH/oh-my-zsh.sh

# Backward search in the shell history with <C-r>
bindkey ^r  history-incremental-search-backward
setopt hist_ignore_all_dups

bindkey "^[[A" history-search-backward

bindkey "^[[B" history-search-forward

# vi mode
bindkey -v

# various aliases and such
source $HOME/dotfiles/aliases.sh

# source ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh

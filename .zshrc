source $HOME/dotfiles/scripts/env.sh

if [ -f  $HOME/dotfiles/zsh/antigen/antigen.zsh ]; then
  source $HOME/dotfiles/zsh/antigen/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle vi-mode
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-history-substring-search
  antigen theme ys
  antigen apply
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

source $HOME/dotfiles/scripts/main.sh

zle -N colorize
bindkey ^W colorize

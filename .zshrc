if [ -f  $HOME/dotfiles/zsh/antigen/antigen.zsh ]; then
  source $HOME/dotfiles/zsh/antigen/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle vi-mode
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-history-substring-search
  antigen theme sorin
  antigen apply
  # bind UP and DOWN arrow keys
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# various aliases and such
source $HOME/dotfiles/aliases.sh

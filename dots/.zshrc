source $HOME/dotfiles/scripts/env.sh

if [ -f  $HOME/dotfiles/scripts/env.sh ]; then
  source $HOME/dotfiles/scripts/env.sh
else
  >&2 echo $fg_bold[red] "Uh oh, no env.sh! Hope this isn't a weird environment."
fi

if [ -f  $HOME/dotfiles/zsh/antigen/antigen.zsh ]; then
  source $HOME/dotfiles/zsh/antigen/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle vi-mode
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-history-substring-search
#  antigen theme dharden/zsh-themes themes/lazyuser
  antigen theme XsErG/zsh-themes themes/lazyuser
  antigen apply
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
else
  >&2 echo $fg_bold[red] "Uh oh, no antigen! You're stuck with regular, boring zsh."
fi

if [ -f $HOME/dotfiles/zsh/base16-shell/base16-solarized.dark.sh ]; then
  source $HOME/dotfiles/zsh/base16-shell/base16-solarized.dark.sh
else
  >&2 echo $fg_bold[red] "Uh oh, no base-16! You're stuck with regular, boring colors."
fi

if [ -f $HOME/dotfiles/scripts/main.sh ]; then
  source $HOME/dotfiles/scripts/main.sh
else
  >&2 echo $fg_bold[red] "Uh oh, no main.sh! Did you move that script, you dummy?"
fi

zle -N colorize
bindkey '^W' colorize

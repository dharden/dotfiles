source $HOME/dotfiles/scripts/env.sh

if [ -f  $HOME/dotfiles/scripts/env.sh ]; then
  source $HOME/dotfiles/scripts/env.sh
else
  >&2 echo $fg_bold[red] "Uh oh, no env.sh! Hope this isn't a weird environment."
fi


if [ -f  $HOME/dotfiles/zsh/antigen/antigen.zsh ]; then
  case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
      ANTIGEN_CACHE=$HOME/.antigen/init-xterm.zsh
      ;;
    *)
      ANTIGEN_CACHE=$HOME/.antigen/init-other.zsh
      ;;
  esac
  source $HOME/dotfiles/zsh/antigen/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle vi-mode
  antigen bundle zsh-users/zsh-completions
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-history-substring-search
  antigen bundle zsh-users/zsh-autosuggestions
  #antigen theme XsErG/zsh-themes themes/lazyuser
  antigen theme hectorpalmatellez/furio-theme
  antigen apply
  bindkey '\eOA' history-substring-search-up
  bindkey '\eOB' history-substring-search-down
else
  >&2 echo $fg_bold[red] "Uh oh, no antigen! You're stuck with regular, boring zsh."
fi

if [ -f $HOME/dotfiles/scripts/main.sh ]; then
  source $HOME/dotfiles/scripts/main.sh
else
  >&2 echo $fg_bold[red] "Uh oh, no main.sh! Did you move that script, you dummy?"
fi

BASE16_SHELL=$HOME/dotfiles/zsh/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)" && source "$BASE16_SHELL/scripts/base16-dracula.sh"

zle -N colorize
bindkey '^W' colorize

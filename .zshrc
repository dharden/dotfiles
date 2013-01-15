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

export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Applications/MAMP/Library/bin/
bindkey -v
alias template_cache='rm -f /workspace/drupal/tmp/cache/remote_template/*'
alias dp='cd ~/workspace/drupal'
alias dpthemes='cd ~/workspace/drupal/sites/all/themes'
alias dpcontemplates='cd ~/workspace/drupal/sites/all/contemplates'
alias dpmodules='cd ~/workspace/drupal/sites/all/modules'
alias dpsites='cd ~/workspace/drupal/sites'

# Commit Current Branch
function ccb {
head=$(git rev-parse --abbrev-ref HEAD)
message="$head $1"
git commit -m "$message"
git log -1 --format="%H" | pbcopy
}

function sshkeyify {
cat ~/.ssh/id_rsa.pub | ssh $1  "mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"
}

export EDITOR='vim'

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

source ~/fez-scripts/fez-scripts.bashrc

# Bacward search in the shell history with <C-r>
bindkey ^r  history-incremental-search-backward
setopt hist_ignore_all_dups

alias gsu='git pull --recurse-submodules && git submodule update --recursive'

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias servethis="python -c 'import SimpleHTTPServer; SimpleHTTPServer.test()'"

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

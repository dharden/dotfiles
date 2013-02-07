#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Applications/MAMP/Library/bin/

test -f $HOME/dotfiles/.work && . $HOME/dotfiles/.work

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


alias gsu='git pull --recurse-submodules && git submodule update --recursive'

alias glog="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

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

alias please="sudo"

# The colors, Duke, the colors!
export GREP_COLOR='1;35'
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
git config --global color.ui true

alias vim='mvim -v'

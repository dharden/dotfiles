#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/Applications/MAMP/Library/bin/

test -f $HOME/.work && . $HOME/dotfiles/work.sh

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

# This is dumb and should only be done if I'm too lazy to compile my own vim on OSX. TODO: Remove this.
alias vim='mvim -v'

# Adapted from http://stackoverflow.com/a/11400433
# TODO: Do some of this logic: https://github.com/kollerma/git-submodule-tools/blob/master/git-rm-submodule
function remove_submodule {
  if [ -d $1 ] ; then
    # Set pathdd_to_submodule var (no trailing slash):
    path_to_submodule=${1}
    # Delete the relevant line from the .gitmodules file:
    git config -f .gitmodules --remove-section submodule.$path_to_submodule
    # Delete the relevant section from .git/config
    git config -f .git/config --remove-section submodule.$path_to_submodule
    # Unstage and remove $path_to_submodule only from the index (to prevent losing information)
    git rm --cached $path_to_submodule
    # Track changes made to .gitmodules
    git add .gitmodules
    # Commit the superproject
    git commit -m "Remove submodule submodule_name"
    # Delete the now untracked submodule files
    rm -rf $path_to_submodule
    rm -rf .git/modules/$path_to_submodule
  else
    echo "'$1' is not a valid directory"
  fi
}

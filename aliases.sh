#!/bin/bash

export PATH=/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin

test -f $HOME/.work && . $HOME/dotfiles/env/work.sh
test -f $HOME/.cygwin && . $HOME/dotfiles/env/cygwin.sh
test -f $HOME/.home && . $HOME/dotfiles/env/home.sh

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

alias ll="ls -al"

function lt() { ls -ltrsa "$@" | tail; }

function psgrep() { ps aux | grep -v grep | grep "$@" -i --color=auto; }

function fname() { find . -iname "*$@*"; }

alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master && open http://31.media.tumblr.com/tumblr_m1hnnbSunI1qf5re0o1_400.gif'

ff() {
  find . \! \( -type d \) -iname "*$1*"
}

fstr() {
  find . -type f -exec grep --color=auto -He "$1" {} \;
}

fstro() {
  vim -p $(find . -type f -exec grep --color=auto -lHe "$1" {} \;) -c "tabdo /$1"
}
weather() {
  curl -s "http://api.wunderground.com/auto/wui/geo/forecastxml/index.xml?query=${@:-10022}" | perl -ne '/<title>([^<]+)/&&printf "%s: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';
}

alias ls='ls -G'
alias tmux='tmux -2'

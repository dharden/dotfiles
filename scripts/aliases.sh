#!/bin/bash
if commandexists mvim; then alias vim='mvim -v'; fi

alias gsu='git pull --recurse-submodules && git submodule update --recursive'

if commandexists python; then alias servethis="python -m SimpleHTTPServer"; fi
if commandexists python3; then alias servethis="python3 -m http.server"; fi

alias please="sudo"

alias ls='ls --color=auto'

alias grep='grep --color=auto'

alias fgrep='fgrep --color=auto'

alias egrep='egrep --color=auto'

alias ll="ls -al"

alias yolo='git commit -am "DEAL WITH IT" && git push -f origin master && open https://31.media.tumblr.com/tumblr_m1hnnbSunI1qf5re0o1_400.gif && say yolo'

alias tmux='tmux -2'

alias glog='git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

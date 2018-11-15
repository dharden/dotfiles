#!/usr/bin/env bash

set -e

TIMESTAMP="$(date +"%T")"

backup() {
  backupdir=$HOME/dotfiles$TIMESTAMP
  mkdir "$backupdir"
  mv "$1" "$backupdir"/.
}

prompt() {
  read -p "$1 already exists. Symlink anyway? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    backup "$1"
  fi
} 

main () {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  if [ -d dots ]; then
    cd dots
  else
    echo "Can't find the dots directory-- make sure you're running this from ~/dotfiles!"
    exit 1
  fi

  find . -type f | while read -r file; do
    dest=$HOME/$file
    if [ -e "$dest" ]; then
      echo "$dest already exists!" >> ~/dotfilestmp
    else
      echo "Symlinking $file!"
      ln -s "$(pwd)"/"$file" "$dest"
    fi
  done

  if [ -e "$HOME"/.vim ]; then
    echo "$HOME/.vim already exists!" >> ~/dotfilestmp
  else
    echo "Symlinking .vim!"
    cd .. || exit
    if [[ -d .vim ]]; then
      ln -s "$DIR"/.vim "$HOME"/.vim
    fi
    cd -
  fi

  if [[ -f ~/dotfilestmp ]]; then
    cat ~/dotfilestmp
    rm ~/dotfilestmp
  fi

  # no motd
  touch "$HOME/.hushlogin"
}

main

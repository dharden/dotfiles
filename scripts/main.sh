#!/bin/bash

# Gonna use this lots of places, so let's create it first.
commandexists() {
  command -v $1 >/dev/null 2>&1
}

source $HOME/dotfiles/scripts/config.sh
source $HOME/dotfiles/scripts/functions.sh
source $HOME/dotfiles/scripts/aliases.sh

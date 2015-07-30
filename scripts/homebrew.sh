#!/usr/bin/env bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install tmux
brew install mosh
brew install caskroom/cask/brew-cask
brew cask install google-chrome
brew cask install slack
brew cask install spotify
brew cask install nosleep
if commandexists xcodebuild; then sudo xcodebuild -license
brew install macvim --override-system-vim && brew linkapps

#!/bin/bash

# system update
apt update

# native deps for brew
apt install -y curl git

# checkout dotfiles
git clone https://github.com/Hacksore/dotfiles.git "$HOME/dotfiles"

# install homebrew
git clone https://github.com/Homebrew/brew "$HOME/homebrew"

cd $HOME
eval "$(homebrew/bin/brew shellenv)"

brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"

# install ansible and stow for configuration
brew install stow

# use brew bundle
brew bundle --file "$HOME/dotfiles/Brewfile"

# install the files with stow
stow .

# done
echo "All config files have been linked..."
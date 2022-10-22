#!/bin/bash

# system update
apt update

# create user for later
useradd -m Hacksore

# native deps for brew
apt install -y curl git

# checkout dotfiles
git clone https://github.com/Hacksore/dotfiles.git "$HOME/dotfiles"

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# load brew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# brew deps
brew install stow zsh

# install ohmyzsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# remove existing one
rm $HOME/.zshrc

# link all dot files
cd $HOME/dotfiles
stow .

# done
echo "All config files have been linked..."
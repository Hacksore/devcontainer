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
brew install stow zsh fzf nvm zsh-syntax-highlighting zsh-autosuggestions zsh-completions thefuck diff-so-fancy

# install ohmyzsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
yes | /home/linuxbrew/.linuxbrew/opt/fzf/install

# remove existing one
rm $HOME/.zshrc

# link all dot files
cd $HOME/dotfiles
stow .

nvm install 16

# done
echo "All config files have been linked..."
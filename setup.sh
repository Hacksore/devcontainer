#!/bin/bash

export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"

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
eval $($HOMEBREW_PREFIX/bin/brew shellenv)

# brew deps
brew install stow zsh fzf nvm zsh-syntax-highlighting zsh-autosuggestions zsh-completions thefuck diff-so-fancy

# install ohmyzsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
yes | $HOMEBREW_PREFIX/opt/fzf/install

# remove existing one
rm $HOME/.zshrc

# load nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm

nvm install 16

# link all dot files
cd $HOME/dotfiles
stow .

# done
echo "All config files have been linked..."
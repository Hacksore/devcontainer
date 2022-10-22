#!/bin/bash
apt update
apt install -y curl git

# install brew
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.zshrc"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install curl
brew install git
brew install nvm
brew install zsh

# setup nvm in zshrc
echo 'export NVM_DIR="$HOME/.nvm"' >> "$HOME/.zshrc"
echo '\n' >> "$HOME/.zshrc"
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.zshrc"

# setup and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# load nvm
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm

# install/use 16
nvm install 16
nvm alias default 16
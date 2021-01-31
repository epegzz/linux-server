#!/bin/zsh

## Install Zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

## Install zsh Pure prompt
mkdir -p “$HOME/.zsh”
git clone https://github.com/sindresorhus/pure.git “$HOME/.zsh/pure”

## Install Autojump
sudo apt-get install autojump

cat << EOF >> ~/.zshrc

# Load defaults from epegzz/linux-server 
. ~/.config/linux-server/.zshrc
EOF

#!/bin/zsh

## set shell to zsh
sudo chsh -s $(which zsh)

## Install Zinit
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh)"


## Install zsh Pure prompt
mkdir -p “$HOME/.zsh”
git clone https://github.com/sindresorhus/pure.git “$HOME/.zsh/pure”

## Install Autojump
sudo apt-get install autojump

cat << EOF >> ~/.zshrc

# Load defaults from epegzz/linux-server 
. ~/.config/linux-server/.zshrc
EOF

## Install EternalTerminal (Ubuntu)
sudo add-apt-repository ppa:jgmath2000/et -y
sudo apt-get update -y
sudo apt-get install et -y
sudo systemctl enable et.service
sudo systemctl start et

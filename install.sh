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

## Install EternalTerminal (Ubuntu)
echo "deb https://github.com/MisterTea/debian-et/raw/master/debian-source/ buster main" | sudo tee -a /etc/apt/sources.list.d/et.list
curl -sSL https://github.com/MisterTea/debian-et/raw/master/et.gpg | sudo apt-key add -
sudo apt update
sudo apt install et

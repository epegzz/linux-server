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

## Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

## Install LazyDocker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

## Add user to docker group (needs restart to work)
sudo groupadd docker
sudo usermod -aG docker $USER

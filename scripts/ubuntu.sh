#!/bin/bash

sudo apt-get update
sudo apt upgrade

#install essentials
sudo apt install -y make gcc curl wget git tmux htop tlp sshfs

#install zsh
sudo apt install -y zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#install nvim
sudo apt install -y neovim

#remove gnome dock
sudo apt remove gnome-shell-extension-ubuntu-dock

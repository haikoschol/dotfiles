#!/bin/bash

ln -s ~/dotfiles/zshrc ~/.zshrc

mkdir -p ~/.config/sway
ln -s ~/dotfiles/sway/config ~/.config/sway/config

mkdir -p ~/.config/i3blocks
ln -s ~/dotfiles/i3blocks/config ~/.config/i3blocks/config

mkdir -p ~/.config/alacritty
ln -s ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/albert
ln -s ~/dotfiles/albert/albert.conf ~/.config/albert/albert.conf

ln -s ~/dotfiles/emacs.d ~/.emacs.d

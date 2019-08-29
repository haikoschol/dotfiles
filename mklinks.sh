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

mkdir -p ~/.config/systemd/user
ln -s ~/dotfiles/systemd/sway-session.target ~/.config/systemd/user/sway-session.target
ln -s ~/dotfiles/systemd/wallpaper.service ~/.config/systemd/user/wallpaper.service
ln -s ~/dotfiles/systemd/wallpaper.timer ~/.config/systemd/user/wallpaper.timer

ln -s ~/dotfiles/emacs.d ~/.emacs.d

mkdir ~/bin
ln -s ~/dotfiles/bin/change_wallpaper.sh ~/bin/change_wallpaper.sh

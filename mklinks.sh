#!/bin/bash

! [[ -e ~/.zshrc ]] && -ln -s ~/dotfiles/zshrc ~/.zshrc
! [[ -e ~/.tmux.conf ]] && ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
! [[ -e ~/.vim ]] && ln -s ~/dotfiles/vim ~/.vim
! [[ -e ~/.vimrc ]] && ln -s ~/dotfiles/vimrc ~/.vimrc
! [[ -e ~/.hammerspoon ]] && ln -s ~/dotfiles/hammerspoon ~/.hammerspoon

mkdir -p ~/.config/alacritty
! [[ -e ~/.config/alacritty/alacritty.yml ]] && ln -s ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/bin
! [[ -e ~/bin/yank ]] && ln -s ~/dotfiles/bin/yank ~/bin/yank

if [[ $(uname) != "Darwin" ]]; then
    mkdir -p ~/.config/sway
    ! [[ -e ~/.config/sway/config ]] && ln -s ~/dotfiles/sway/config ~/.config/sway/config

    mkdir -p ~/.config/i3blocks
    ! [[ -e ~/.config/i3blocks/config ]] && ln -s ~/dotfiles/i3blocks/config ~/.config/i3blocks/config

    mkdir -p ~/.config/albert
    ! [[ -e ~/.config/albert/albert.conf ]] && ln -s ~/dotfiles/albert/albert.conf ~/.config/albert/albert.conf

    mkdir -p ~/.config/redshift
    ! [[ -e ~/.config/redshift/redshift.conf ]] && ln -s ~/dotfiles/redshift/redshift.conf ~/.config/redshift/redshift.conf

    mkdir -p ~/.config/systemd/user
    ! [[ ~/.config/systemd/user/sway-session.target ]] && ln -s ~/dotfiles/systemd/sway-session.target ~/.config/systemd/user/sway-session.target
    ! [[ -e ~/.config/systemd/user/wallpaper.service ]] && ln -s ~/dotfiles/systemd/wallpaper.service ~/.config/systemd/user/wallpaper.service
    ! [[ -e ~/.config/systemd/user/wallpaper.timer ]] && ln -s ~/dotfiles/systemd/wallpaper.timer ~/.config/systemd/user/wallpaper.timer
    ! [[ -e ~/.config/systemd/user/redshift.service ]] && ln -s ~/dotfiles/systemd/redshift.service ~/.config/systemd/user/redshift.service

    ! [[ -e ~/bin/change_wallpaper.sh ]] && ln -s ~/dotfiles/bin/change_wallpaper.sh ~/bin/change_wallpaper.sh
    ! [[ -e ~/bin/update_everything.sh ]] && ln -s ~/dotfiles/bin/update_everything.sh ~/bin/update_everything.sh

    ! [[ -e ~/.Xresources ]] && ln -s ~/dotfiles/Xresources ~/.Xresources
fi

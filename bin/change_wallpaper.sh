#!/bin/sh

STASH="$HOME/Pictures/wallpapers/"
WP=$(ls $STASH | shuf -n 1)
ln -f -s $STASH$WP $HOME/wallpaper.jpg

swaymsg output "*" bg $HOME/wallpaper.jpg fill

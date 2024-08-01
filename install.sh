#!/usr/bin/env bash

set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitconfig.local.template" ] && continue
    [ "$f" = ".gitmodules" ] && continue

    ln -snfv ${PWD}/"$f" ~/
done

# link starship
ln -snfv ${PWD}/starship.toml ~/.config

ln -snfv ${PWD}/alacritty/alacritty.toml ~/.config/alacritty
ln -snfv ${PWD}/alacritty/dracura.toml ~/.config/alacritty
ln -snfv ${PWD}/zellij/config.kdl ~/.config/zellij

#font install
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zipget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip
unzip Hack.zip -d "$HOME/.local/share/fonts"
fc-cache -fv

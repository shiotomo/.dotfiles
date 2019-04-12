#!/bin/bash

git clone https://github.com/junegunn/fzf.git ~/.fzf
git clone git@github.com:shiotomo/.vim.git ~/.vim
git clone git@github.com:shiotomo/aquarium.git ~/aquarium

cd
ln -s ~/.dotfiles/zsh/.zshrc
ln -s ~/.dotfiles/tmux/.tmux.conf
ln -s ~/.dotfiles/.inputrc

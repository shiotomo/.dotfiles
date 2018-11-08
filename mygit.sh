#!/bin/bash

cd
git clone https://github.com/junegunn/fzf.git ~/.fzf
mkdir .vim
cd .vim
git clone https://github.com/shiotomo/.vim.git ~/.vim

cd
ln -s ~/.dotfiles/zsh/.zshrc
ln -s ~/.dotfiles/tmux/.tmux.conf
ln -s ~/.dotfiles/.inputrc

#!/bin/bash

# fzf
git clone https://github.com/junegunn/fzf.git ~/.fzf

# Database manager by docker
git clone git@github.com:shiotomo/aquarium.git ~/aquarium

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Set .dotfiles symbolic link
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/vimshrc ~/.vimshrc
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/eclipse/vrapperrc ~/.vrapperrc
ln -s ~/.dotfiles/intelliJ_IDEA/ideavimrc ~/.ideavimrc

# Vim setting
mkdir ~/.dotfiles/vim/bundle
mkdir ~/.dotfiles/vim/help

git clone git@github.com:vim-jp/vimdoc-ja.git ~/.dotfiles/vim/help

curl -flo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

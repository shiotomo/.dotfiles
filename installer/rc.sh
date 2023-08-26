#!/bin/bash

# fzf
git clone https://github.com/junegunn/fzf.git ~/.fzf

# Database manager by docker
git clone https://github.com:shiotomo/aquarium.git ~/aquarium

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# hammerspoon setting
mkdir ~/.hammerspoon
mkdir -p ~/.config/nvim
mkdir -p ~/.config/zsh

# Set .dotfiles symbolic link
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/nvim/lua ~/.config/nvim
ln -s ~/.dotfiles/vim/vimshrc ~/.vimshrc
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/gemrc ~/.gemrc
ln -s ~/.dotfiles/eclipse/vrapperrc ~/.vrapperrc
ln -s ~/.dotfiles/idea/ideavimrc ~/.ideavimrc
ln -s ~/.dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua
ln -s ~/.dotfiles/git/tigrc ~/.tigrc

# Vim setting
mkdir ~/.dotfiles/vim/bundle
mkdir ~/.dotfiles/vim/help

git clone https@github.com:vim-jp/vimdoc-ja.git ~/.dotfiles/vim/help

curl -flo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# NeoVim setting
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


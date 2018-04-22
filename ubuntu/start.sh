#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

# install
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get -y install neovim
# sudo apt-get -y install vim
sudo apt-get -y install tmux
sudo apt-get -y install zsh
sudo apt-get -y install htop
sudo apt-get -y install screenfetch
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install ruby
sudo apt-get -y install gem
sudo apt-get -y install make
sudo apt-get -y install curl
sudo apt-get -y install postgresql
sudo apt-get -y install libpq-dev
sudo apt-get -y install nginx

# heroku
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

# vim install
sudo apt-cache -i depends vim
sudo apt-get remove --purge vim vim-runtime vim-common
sudo rm -rf /usr/local/share/vim
sudo rm /usr/local/bin/vim

sudo apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev

cd /opt/
sudo git clone https://github.com/vim/vim 
cd vim/

sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-lpython3interp=dynamic --enable-rubyinterp=dynamic 

sudo make
sudo make install

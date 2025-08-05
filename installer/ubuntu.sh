#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

## library
# sudo apt-get install software-properties-common
# sudo add-apt-repository ppa:neovim-ppa/unstable
# sudo apt-get -y install neovim
# sudo apt-get -y install vim
# sudo apt-get -y install postgresql
sudo apt-get -y install curl
sudo apt-get -y install direnv
sudo apt-get -y install eza
sudo apt-get -y install fish
sudo apt-get -y install gem
sudo apt-get -y install git
sudo apt-get -y install golang
sudo apt-get -y install graphviz
sudo apt-get -y install htop
sudo apt-get -y install iftop
sudo apt-get -y install language-pack-ja
sudo apt-get -y install letsencrypt
sudo apt-get -y install libmariadbclient-dev
sudo apt-get -y install libpq-dev
sudo apt-get -y install make
sudo apt-get -y install netdiscover
sudo apt-get -y install nginx
sudo apt-get -y install nodejs
sudo apt-get -y install npm
sudo apt-get -y install python
sudo apt-get -y install python3
sudo apt-get -y install python3-pip
sudo apt-get -y install ruby
sudo apt-get -y install screenfetch
sudo apt-get -y install tmux
sudo apt-get -y install tree
sudo apt-get -y install vim
sudo apt-get -y install zsh

sudo update-locale LANG=ja_JP.UTF-8

## my git
./rc.sh

## pip
pip3 install neovim

# heroku
# wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh

## vim
# sudo apt-cache -i depends vim
# sudo apt-get remove --purge vim vim-runtime vim-common
# sudo rm -rf /usr/local/share/vim
# sudo rm /usr/local/bin/vim
# 
# sudo apt-get install -y git build-essential ncurses-dev lua5.2 lua5.2-dev luajit python-dev python3-dev ruby-dev
# 
# cd /opt/
# sudo git clone https://github.com/vim/vim
# cd vim/
# 
# sudo ./configure --with-features=huge --enable-multibyte --enable-luainterp=dynamic --enable-gpm --enable-cscope --enable-fontset --enable-fail-if-missing --prefix=/usr/local --enable-pythoninterp=dynamic --enable-lpython3interp=dynamic --enable-rubyinterp=dynamic --enable-python3interp
# 
# sudo make
# sudo make install

# setting timezone
sudo rm /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# asdf
# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

# mise
curl https://mise.run | sh

# docker

docker install
sudo apt-get remove -y docker docker-engine docker.io

sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce

sudo service docker start

sudo usermod -aG docker $USER

sudo systemctl enable docker

### Install Docker Compose

sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

# setting zplug
# curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# install zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

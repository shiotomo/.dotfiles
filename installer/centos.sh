#!/bin/bash

./rc.sh

sudo yum update
sudo yum install -y zsh
sudo yum install -y fish
sudo yum install -y tmux
sudo yum install -y mercurial
sudo yum install -y ncurses-devel
sudo yum install -y make
sudo yum install -y gcc
sudo yum install -y openssl-devel readline-devel zlib-devel
sudo yum install -y postgresql-devel
sudo yum install -y nginx
sudo yum install -y epel-release
sudo yum install -y nodejs
sudo yum install -y htop
sudo yum install -y ruby
sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y python36u python36u-devel python36u-libs python36u-pip python-devel lua-devel
sudo pip3.6 install neovim

# vim install
cd /usr/local/src
sudo hg clone https://bitbucket.org/vim-mirror/vim vim
cd vim
sudo hg pull
sudo ./configure \
 --enable-fail-if-missing \
 --with-features=huge \
 --disable-selinux \
 --enable-luainterp \
 --enable-pythoninterp=dynamic \
 --with-python-config-dir=/usr/lib64/python2.7/config \
 --enable-python3interp=dynamic \
 --with-python3-config-dir=/usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu \
 --enable-cscope \
 --enable-fontset \
 --enable-multibyte \
 vi_cv_path_python3=/usr/bin/python3.6

sudo make
sudo make install

# postgresql install
sudo yum install -y https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm
sudo yum install -y postgresql96-server postgresql96-contrib
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl start postgresql-9.6.service
sudo systemctl enable postgresql-9.6.service

# asdf install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.0

# setting zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

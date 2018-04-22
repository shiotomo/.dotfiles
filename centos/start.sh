#!/bin/bash

sudo yum update
sudo yum install -y zsh
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

# vim install
cd /usr/local/src
sudo hg clone https://bitbucket.org/vim-mirror/vim vim
cd vim
sudo hg pull
sudo ./configure --with-features=huge --enable-multibyte --disable-selinux
sudo make
sudo make install

# postgresql install
sudo yum install -y https://yum.postgresql.org/9.6/redhat/rhel-7-x86_64/pgdg-redhat96-9.6-3.noarch.rpm
sudo yum install -y postgresql96-server postgresql96-contrib
sudo /usr/pgsql-9.6/bin/postgresql96-setup initdb
sudo systemctl start postgresql-9.6.service
suod systemctl enable postgresql-9.6.service

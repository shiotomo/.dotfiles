#/bin/bash

curl -o $HOME/.dotfiles/tmp/mysql.deb https://repo.mysql.com/mysql-apt-config_0.8.10-1_all.deb
sudo dpkg -i $HOME/.dotfiles/tmp/mysql.deb
sudo apt-get -y update
sudo apt-get install -y mysql-server mysql-client libmysqlclient-dev

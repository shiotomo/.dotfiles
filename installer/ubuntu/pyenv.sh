#!/bin/bash
sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install python-pygame
sudo apt-get -y install python-pip
sudo apt-get -y install python-tk tk-dev

sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils

git clone https://github.com/yyuu/pyenv.git ~/.pyenv

exec $SHELL

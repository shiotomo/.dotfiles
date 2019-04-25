#!/bin/bash
# sudo apt-get update
# sudo apt-get -y upgrade
# 
# sudo apt-get -y install docker
# sudo apt-get -y install docker-compose
# 
# sudo usermod -aG docker $USER

### Install Docker

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

# サービス開始
sudo service docker start

sudo usermod -aG docker $USER

# 自動起動の有効化
sudo systemctl enable docker

### Install Docker Compose

sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

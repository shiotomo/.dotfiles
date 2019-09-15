#!/bin/bash

all_install() {
  ./mygit.sh
  ./ubuntu/start.sh
  ./ubuntu/rbenv.sh
  ./ubuntu/pyenv.sh
  ./ubuntu/goenv.sh
  ./ubuntu/node.sh
  ./ubuntu/lang.sh
  ./ubuntu/java.sh
  ./ubuntu/docker.sh
  ./ubuntu/scala.sh
  ./ubuntu/mysql.sh
  ../zsh/install.sh
}

mini_install() {
  ./mygit.sh
  ./ubuntu/start.sh
  ./ubuntu/rbenv.sh
  ./ubuntu/pyenv.sh
  ./ubuntu/goenv.sh
  ./ubuntu/node.sh
  ./ubuntu/lang.sh
  ./ubuntu/docker.sh
  ./ubuntu/scala.sh
  ./ubuntu/timezone.sh
  # ./ubuntu/mysql.sh
  ../zsh/install.sh
}

if [ "$1" = "all" ]; then
  echo 'Library all install'
  all_install
elif [ "$1" = "mini" ]; then
  echo 'Library mini install'
  mini_install
else
  echo '実行時引数にallかminiを設定してください'
  echo 'all: 全ライブラリ・ミドルウェア類をインストール'
  echo 'mini: 必要最低限のライブラリ・ミドルウェア類をインストール'
  exit 1
fi

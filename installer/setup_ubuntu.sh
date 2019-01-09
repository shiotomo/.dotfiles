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
  ./ubuntu/timezone.sh
}

case "$1" in
  all)
    all_install
    ;;
  mini)
    mini_install
    ;;
esac

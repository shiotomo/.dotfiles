#!/bin/bash

case $1 in
  macos*)
    bash `dirname $0`/setup_macos.sh
    ;;
  ubuntu*)
    bash `dirname $0`/setup_ubuntu.sh
    ;;
  centos*)
    bash `dirname $0`/setup_centos.sh
    ;;
esac

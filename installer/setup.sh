#!/bin/bash

case $1 in
  macos*)
    bash `dirname $0`/macos.sh
    ;;
  ubuntu*)
    bash `dirname $0`/ubuntu.sh
    ;;
  centos*)
    bash `dirname $0`/centos.sh
    ;;
esac

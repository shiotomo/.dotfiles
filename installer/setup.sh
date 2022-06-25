#!/bin/bash

case ${OSTYPE} in
  macos*)
    .`dirname $0`/mygit.sh
    .`dirname $0`/setup_macos.sh
    ;;
  ubuntu*)
    .`dirname $0`/mygit.sh
    .`dirname $0`/setup_ubuntu.sh
    ;;
  centos*)
    .`dirname $0`/mygit.sh
    .`dirname $0`/setup_centos.sh
    ;;
esac

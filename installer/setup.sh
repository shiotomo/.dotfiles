#!/bin/bash

case ${OSTYPE} in
  macos*)
    setup_macos.sh
    ;;
  ubuntu*)
    setup_ubuntu.sh
    ;;
  centos*)
    setup_centos.sh
    ;;
esac

#!/bin/bash

echo "export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS=\"1\"" >> .zsh.d/wsl.zsh
echo "# export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=\"/home/${USER}/vagrant/ubuntu\"" >> .zsh.d/wsl.zsh
echo "export VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH=\"/mnt/c/Users/${USER}/\"" >> .zsh.d/wsl.zsh
echo "# export VAGRANT_HOME=/mnt/d/vagrant-home/.vagrant.d/" >> .zsh.d/wsl.zsh
echo "export PATH=\$PATH:\"/mnt/c/Program Files/Oracle/VirtualBox\"" >> .zsh.d/wsl.zsh

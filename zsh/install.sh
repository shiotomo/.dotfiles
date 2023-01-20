#!/bin/bash

echo "setup zsh"
echo "install zinit."
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
echo "install zinit compleate."

echo "setup ~/.confg/zsh"
if [ ! -e $HOME/.config/zsh ]; then
  mkdir -p $HOME/.config/zsh
  echo "create ~/.confg/zsh"
  tocuh $HOME/.config/zsh/workspace.list
  echo "create ~/.confg/zsh/workspace.list"
fi
echo "complete !!"

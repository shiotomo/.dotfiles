#!/bin/bash

pkg_list=(
MS-CEINTL.vscode-language-pack-ja
vscodevim.vim
ms-python.python
dbaeumer.vscode-eslint
ms-vscode.cpptools
rebornix.Ruby
hridoy.rails-snippets
mgmcdermott.vscode-language-babel
vscode-icons-team.vscode-icons
ms-azuretools.vscode-docker
ms-vscode.Go
redhat.vscode-yaml
James-Yu.latex-workshop
torn4dom4n.latex-support
ajshort.latex-preview
eg2.vscode-css-properties
jebbs.plantuml
kaiwood.endwise
oderwat.indent-rainbow
mosapride.zenkaku
streetsidesoftware.code-spell-checker
shardulm94.trailing-spaces
mhutchie.git-graph
)

for i in ${pkg_list[@]}; do
  code --install-extension $i
done

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled

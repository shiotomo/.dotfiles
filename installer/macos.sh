#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

./rc.sh

brew install --cask google-chrome
brew install --cask hammerspoon
brew install --cask karabiner-elements
brew install --cask key-codes
brew install --cask mysqlworkbench
brew install --cask postman
brew install --cask vagrant
brew install --cask virtualbox
brew install --cask devtoys
brew tap heroku/brew && brew install heroku

# brew install mysql
# brew install mysql-client
# brew install mysql@5.7
# brew install postgresql
# brew install redis
brew install ansible
brew install asdf
brew install autoconf
brew install bash
brew install bat
brew install dep
brew install direnv
brew install exa
brew install file-formula
brew install fish
brew install fontconfig
brew install freetype
brew install fswatch
brew install gawk
brew install gcc
brew install gd
brew install gdbm
brew install gettext
brew install git
brew install glib
brew install gmp
brew install go
brew install gpg
brew install graphviz
brew install gts
brew install heroku
brew install heroku-node
brew install htop
brew install hugo
brew install icu4c
brew install imagemagick
brew install isl
brew install jasper
brew install jemalloc
brew install jgradle
brew install jpeg
brew install jpegoptim
brew install lagygit
brew install libevent
brew install libffi
brew install libidn2
brew install libmagic
brew install libmpc
brew install libpng
brew install libtermkey
brew install libtiff
brew install libtool
brew install libunistring
brew install libuv
brew install libvterm
brew install libyaml
brew install lua
brew install lua@5.1
brew install luajit
brew install luarocks
brew install mono
brew install mpfr
brew install msgpack
brew install ncdu
brew install ncurses
brew install neovim
brew install netpbm
brew install node
brew install openssl
brew install pcre
brew install pcre2
brew install perl
brew install pkg-config
brew install plantuml
brew install poetry
brew install prettyping
brew install python
brew install python@2
brew install readline
brew install ripgrep
brew install rsync
brew install ruby
brew install ruby-build
brew install sbt
brew install scala
brew install screenfetch
brew install shfmt
brew install sqlite
brew install tmux
brew install tree
brew install unibilium
brew install unison
brew install vim
brew install webp
brew install wget
brew install xz
brew install zsh

# asdf plugin
asdf plugin-add ruby
asdf plugin-add java
asdf plugin-add golang
asdf plugin-add python
asdf plugin-add nodejs
asdf plugin-add scala
asdf plugin-add kotlin

asdf plugin-add gradle

# setting zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

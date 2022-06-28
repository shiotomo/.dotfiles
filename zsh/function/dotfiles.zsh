dth() {
  rm -rf ~/.dotfiles
  git clone https://github.com/shiotomo/.dotfiles.git
  cd ./dotfiles
  make rc
}

dtg() {
  rm -rf ~/.dotfiles
  git clone git@github.com:shiotomo/.dotfiles.git
  cd ./dotfiles
  make rc
}

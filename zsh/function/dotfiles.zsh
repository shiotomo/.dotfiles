dth() {
  rm -rf ~/.dotfiles
  cd ~
  git clone https://github.com/shiotomo/.dotfiles.git
  cd ~/.dotfiles
  make rc
}

dtg() {
  rm -rf ~/.dotfiles
  cd ~
  git clone git@github.com:shiotomo/.dotfiles.git
  cd ~/.dotfiles
  make rc
}

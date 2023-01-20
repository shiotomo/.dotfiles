dotfiles() {
  cd ~/.dotfiles
  RESULT=(`tmux ls | grep -E "^dotfiles:"`)
  if [ -n "$TMUX" ]; then
    tmux switch -t dotfiles
  elif [ -n "$RESULT" ]; then
    tmux a -t dotfiles
  else
    tmux new-session -s dotfiles
  fi
}


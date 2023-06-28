dotfiles() {
  cd ~/.dotfiles
  RESULT=(`tmux ls | grep -E "^dotfiles:"`)
  if [ -n "$TMUX" ]; then
    tmux switch -t _dotfiles
  elif [ -n "$RESULT" ]; then
    tmux a -t _dotfiles
  else
    tmux new-session -s _dotfiles
  fi
}

tnew() {
  tmux new-session -s $1
}

ta() {
  tmux attach
}

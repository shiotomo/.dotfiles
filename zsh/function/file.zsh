# alias ff='cd $(find . -name "*" -type d | fzf)' を使いやすくしたもの
ff() {
  dirp=$(find . -name "*" -type d | fzf)
  if [ -z "$dirp" ]; then
    return
  else
    cd $dirp
  fi
}

# alias fa='vim $(find . -name "*" -type f | fzf)' を使いやすくしたもの
fa() {
  dirp=$(find . -name "*" -type f | fzf)
  if [ -z "$dirp" ]; then
    return
  else
    vim $dirp
  fi
}

# .config/zsh/workspace.listに設定したディレクトリに移動するためのコマンド
ws() {
  local dir=$(cat $HOME/.config/zsh/workspace.list | fzf)
  cd $dir
}

# .config/zsh/workspace.listに設定したディレクトリに移動するためのコマンド
wse() {
  vim $HOME/.config/zsh/workspace.list
}

tws() {
  local dir=$(cat $HOME/.config/zsh/workspace.list | fzf)
  local dir_name=`basename ${dir}`
  RESULT=(`tmux ls | grep -E "^$dir_name:"`)
  if [ -n "$TMUX" ] && [ -n "$RESULT" ]; then
    tmux switch -t $dir_name
  elif [ -n "$TMUX" ]; then
    echo "以下のコマンドを tmux detach した後実行してください。"
    echo "cd $dir_name && tmux new-session -s $dir_name"
    echo "cd $dir_name && tmux new-session -s $dir_name" | clip
    echo "上記のコマンドを clip boardにコピーしました。"
  elif [ -n "$RESULT" ]; then
    tmux a -t $dir_name
  else
    cd $dir_name
    tmux new-session -s $dir_name
  fi
}

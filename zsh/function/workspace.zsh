ws() {
  case $1 in
    move|m)
      local dir=$(cat $HOME/.config/zsh/workspace.list | fzf)
      cd $dir
      ;;
    add)
      local full_path=$(dirname `pwd`)/$(basename `pwd`)
      echo $full_path >> $HOME/.config/zsh/workspace.list
      echo "workspace add ${full_path}"
      ;;
    edit)
      $EDITOR $HOME/.config/zsh/workspace.list
      ;;
    tmux|t)
      local dir=$(cat $HOME/.config/zsh/workspace.list | fzf)
      local dir_name=`basename ${dir}`
      local tmux_session_name=`(basename $dir | sed -e 's/^\./_/g')`
      local result=(`tmux ls | grep -E "^$tmux_session_name:"`)
      if [ -n "$TMUX" ] && [ -n "$result" ]; then
        tmux switch -t $tmux_session_name
      elif [ -n "$TMUX" ]; then
        echo "以下のコマンドを tmux detach した後実行してください。"
        # echo "cd $dir_name && tmux new-session -s $dir_name"
        # echo "cd $dir_name && tmux new-session -s $dir_name" | clip
        echo "tmux new-session -s $tmux_session_name"
        echo "tmux new-session -s $tmux_session_name" | clip
        echo "上記のコマンドを clip boardにコピーしました。"
      elif [ -n "$RESULT" ]; then
        tmux a -t $tmux_session_name
      else
        cd $dir
        tmux new-session -s $tmux_session_name
      fi
      ;;
    current)
      local tmux_session_name=`(basename $(pwd) | sed -e 's/^\./_/g')`
      tmux new-session -s $tmux_session_name
      ;;
    switch|s)
      local session=(`tmux ls | awk '{sub(":.*", ""); print $0;}' | fzf`)
      if [ -n "$TMUX" ]; then
        tmux switch -t $session
      else
        tmux a -t $session
      fi
      ;;
    open)
      local dir=$2
      local dir_name=`basename ${dir}`
      cd $dir_name
      tmux new-session -s $dir_name
      ;;
    *)
      echo "ws command not found option."
  esac
}

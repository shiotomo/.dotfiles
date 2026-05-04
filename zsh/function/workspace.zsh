ws() {
  case $1 in
    move|m)
      local dir=$(cat $HOME/.config/zsh/workspace.list | fzf)
      cd $dir
      ;;
    add|a)
      local full_path=$(dirname `pwd`)/$(basename `pwd`)
      echo $full_path >> $HOME/.config/zsh/workspace.list
      echo "workspace add ${full_path}"
      ;;
    edit|e)
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
        cd $dir
        tmux new-session -ds $tmux_session_name
        tmux switch -t $tmux_session_name
      elif [ -n "$result" ]; then
        tmux a -t $tmux_session_name
      else
        cd $dir
        tmux new-session -s $tmux_session_name
      fi
      ;;
    current|c)
      local tmux_session_name=`(basename $(pwd) | sed -e 's/^\./_/g')`
      local result=(`tmux ls | grep -E "^$tmux_session_name:"`)
      if [ -n "$TMUX" ] && [ -n "$result" ]; then
        tmux switch -t $tmux_session_name
      elif [ -n "$TMUX" ]; then
        tmux new-session -ds $tmux_session_name
        tmux switch -t $tmux_session_name
      elif [ -n "$result" ]; then
        tmux a -t $tmux_session_name
      else
        cd $dir
        tmux new-session -s $tmux_session_name
      fi
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
    quit|q)
      current=$(tmux display-message -p '#S')
      tmux switch-client -l
      tmux kill-session -t "$current"
      ;;
    *)
      echo "ws command not found option."
  esac
}

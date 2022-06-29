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


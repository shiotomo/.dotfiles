# alias ff='cd $(find . -name "*" -type d | fzf)' を使いやすくしたもの
ecd() {
  dirp=$(find . -name "*" -type d | fzf)
  if [ -z "$dirp" ]; then
    return
  else
    cd $dirp
  fi
}

# alias fa='vim $(find . -name "*" -type f | fzf)' を使いやすくしたもの
evim() {
  dirp=$(find . -name "*" -type f | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
  if [ -z "$dirp" ]; then
    return
  else
    vim $dirp
  fi
}


git-add() {
  local files=$(git status --porcelain | fzf -m --query="$@" | awk '{ print $2 }' | sed -e 's|^|:/|' | tr "\n" ' ')
  if test -n "$files"; then
    BUFFER="git add $files"
    zle end-of-line
    zle accept-line
  fi
}

git-branch() {
  local option=${1:-'-l'}
  shift
  fmt="\
  %(if:equals=$user_name)%(authorname)%(then)%(color:default)%(else)%(color:brightred)%(end)%(refname:short)|\
  %(committerdate:relative)|\
  %(subject)"
  branch=$(
    git branch --sort=-committerdate --format=$fmt --color=always \
    | column -ts'|' \
    | fzf --ansi --exact --preview='git log --oneline --graph --decorate --color=always -50 {+1}' \
    | awk '{print $1}' \
  )
  if test -n "$branch"; then
    if test "$BUFFER" = ''; then
      BUFFER="git switch"
      test "$option" = '-r' && BUFFER+=" -t"
      BUFFER+=" $branch"
      zle end-of-line
      zle accept-line
    else
      BUFFER="${LBUFFER}${branch}${RBUFFER}"
      CURSOR+=${#branch}
      zle redisplay
    fi
  fi
}

git-switch-local-branch() {
  git-branch "$@"
}

git-switch-remote-branch() {
  git-branch '-r' "$@"
}

re() {
  local option="$(echo -e "--staged\n--worktree" | fzf --query="$@")"
  git restore $option $(git status -s -uno | fzf --prompt="\$ git restore $option (git status -s -uno)> " | awk '{print $2}')
}

zle -N git-add
bindkey "^ga" git-add

zle -N git-switch-local-branch
bindkey "^g^b" git-switch-local-branch

zle -N git-switch-remote-branch
bindkey "^g^g^b" git-switch-remote-branch


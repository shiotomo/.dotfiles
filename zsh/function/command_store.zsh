# =========================
# Command Store
# =========================

CS_FILE="$HOME/.config/zsh/command_store.list"

# --- コメント除去（" # comment" だけ消す）
_cs_strip_comment() {
  echo "$1" | sed 's/[[:space:]]#.*$//'
}

cs() {
  case "$1" in
    e|edit)
      ${EDITOR:-nvim} "$CS_FILE"
      ;;
    a|add)
      local last_cmd
      last_cmd=$(fc -ln -1)

      if [[ -n "$last_cmd" ]]; then
        echo "$last_cmd" >> "$CS_FILE"
        echo "Added: $last_cmd"
      fi
      ;;
    *)
      cat "$CS_FILE" | fzf
      ;;
  esac
}

cs_widget() {
  local selected
  selected=$(cat "$CS_FILE" | fzf)

  if [[ -n "$selected" ]]; then
    local cmd
    cmd=$(_cs_strip_comment "$selected")

    BUFFER="$cmd"
    CURSOR=${#BUFFER}
  fi
}

zle -N cs_widget

# コマンドリスト呼び出し
bindkey '^xc' cs_widget

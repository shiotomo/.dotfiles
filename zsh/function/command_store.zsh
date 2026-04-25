# =========================
# Command Store
# =========================

CS_FILE="$HOME/.config/zsh/command_store.list"

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
      # 通常コマンドでは「出力だけ」
      cat "$CS_FILE" | fzf
      ;;
  esac
}

cs_widget() {
  local selected
  selected=$(cat "$CS_FILE" | fzf)

  if [[ -n "$selected" ]]; then
    BUFFER="$selected"
    CURSOR=${#BUFFER}
  fi
}

zle -N cs_widget

# コマンドリスト呼び出し
bindkey '^xc' cs_widget

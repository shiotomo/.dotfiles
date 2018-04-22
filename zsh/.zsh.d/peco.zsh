#======= peco.zsh =======
# pecoの設定ファイル
#======================

# Linuxのみ使用可能
case ${OSTYPE} in
  linux*)
    function peco-select-history() {
      BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
      CURSOR=$#BUFFER
      zle clear-screen
    }
    zle -N peco-select-history
    bindkey '^r' peco-select-history

    function peco-pkill() {
      for pid in `ps aux | peco | awk '{ print $2 }'`
      do
        kill $pid
        echo "Killed ${pid}"
      done
    }
    alias pk="peco-pkill"
esac

#======= os.zsh =======
# os毎のzsh設定ファイル
#======================

case ${OSTYPE} in
  # Linux用の設定
  linux*)
  alias ncpu='cat /proc/cpuinfo | grep processor | wc -l'
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  export PATH="$HOME/.goenv/bin:$PATH"
  export GOPATH=$HOME/go
  eval "$(goenv init -)"
  export PATH=$PATH:$GOPATH/bin
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  ;;
cygwin*)
  # cygwin用の設定
  alias csc='/cygdrive/c/WINDOWS/MICROSOFT.NET/Framework/v4.0.30319/csc'
  alias python='python3'
  alias python_x='run xwin-multiwindow && export DISPLAY=:0.0'
  alias open='cygstart'

  # DELETE key
  bindkey "^[[3~" delete-char
  # HOME key
  bindkey "^[[1~" beginning-of-line
  # END key
  bindkey "^[[4~" end-of-line
esac

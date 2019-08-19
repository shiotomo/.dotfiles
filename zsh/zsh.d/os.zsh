#======= os.zsh =======
# os毎のzsh設定ファイル
#======================

case ${OSTYPE} in
  linux*)
    # Linux用の設定
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
    export PATH="${HOME}/.scalaenv/bin:${PATH}"
    eval "$(scalaenv init -)"
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
    ;;
  darwin*)
    # MacOS用の設定
    alias ncpu='cat /proc/cpuinfo | grep processor | wc -l'
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    export PATH=/usr/local/Cellar/postgresql/10.1/bin/:$PATH
    export PATH=/usr/local/opt/mysql@5.7/bin:$PATH
    export PATH="${HOME}/.scalaenv/bin:${PATH}"
    export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
    eval "$(scalaenv init -)"
    # Javaのバージョンを8に切り替える
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    alias brew="PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew"
    export PATH="/usr/local/opt/ncurses/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/ncurses/lib"
    export CPPFLAGS="-I/usr/local/opt/ncurses/include"
    ;;
esac

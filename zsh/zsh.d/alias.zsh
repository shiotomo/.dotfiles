alias ....='cd ../../..'
alias ...='cd ../..'
alias rm='rm -i'
alias v='vim'
alias vm='vim'
alias vum='vim'
alias tmux='tmux -2'
alias t='tmux -2'
alias es='exec $SHELL'
alias jquery='curl https://code.jquery.com/jquery-3.3.1.min.js >> jquery.js'
alias bootstrap='wget https://github.com/twbs/bootstrap/releases/download/v3.3.7/bootstrap-3.3.7-dist.zip'
alias q='exit'
alias bootstrap4='wget https://github.com/twbs/bootstrap/archive/v4.1.3.zip'
alias wordpress='wget https://ja.wordpress.org/wordpress-4.9.5-ja.zip'

case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    alias la='ls -A -G'
    alias ll='ls -alF -G'
    alias l='ls -CF -G'
    alias ls='ls -G'
    alias clip="pbcopy"
    alias tomcat-start='/usr/local/tomcat/bin/startup.sh'  #起動コマンド 
    alias tomcat-shutdown='/usr/local/tomcat/bin/shutdown.sh'  #終了コマンド
    alias tomcat-version='/usr/local/tomcat/bin/version.sh' #バージョンコマンド
    ;;
  linux*)
    # Linux用の設定
    alias la='ls -A --color=auto'
    alias ll='ls -alF --color=auto'
    alias l='ls -CF --color=auto'
    alias ls='ls --color=auto'
    ;;
  cygwin*)
    # cygwin用の設定
    alias la='ls -A --color=auto'
    alias ll='ls -alF --color=auto'
    alias l='ls -CF --color=auto'
    alias ls='ls --color=auto'
    ;;
esac

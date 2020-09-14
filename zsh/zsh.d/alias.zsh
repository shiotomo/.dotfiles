alias ....='cd ../../..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias v='vim'
alias vm='vim'
alias vum='vim'
alias tmux='tmux -2'
alias t='tmux -2'
alias es='exec $SHELL'
alias q='exit'
alias lip='localip'

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

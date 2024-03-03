# === alias ===

# git
abbrev-alias ga="git add "
abbrev-alias gb="git branch"
abbrev-alias gck="git checkout"
abbrev-alias gch="git branch -a | fzf | xargs git checkout"
abbrev-alias gcm="git commit -m"
abbrev-alias git-branch-clean="git branch | grep -v 'master' | xargs git branch -D"
abbrev-alias gnbf="git checkout -b feature/"
abbrev-alias gdi="git diff"
abbrev-alias gpl="git pull"
abbrev-alias gps="git push"
abbrev-alias gpsh="git push -u origin HEAD"
abbrev-alias gr="git reset"
abbrev-alias grb="git rebase -i HEAD~"
abbrev-alias grbh="git rebase -i HEAD~"
abbrev-alias grhard="git reset --hard"
abbrev-alias gs="git status"
abbrev-alias gsw="git branch -a | fzf | xargs git switch"

# tig
abbrev-alias tigs='tig status'
abbrev-alias tigb='tig branch'

# common
alias ....='cd ../../..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias es='exec $SHELL'
alias q='exit'
alias lip='localip'
alias back='cd -1'
alias bcd='cd -1'

# Vim
if type nvim > /dev/null; then
  alias vim='nvim'
fi

alias vi='vim'
alias v='vim'
alias vm='vim'
alias vum='vim'

# tmux
alias tmux='tmux -2'
alias t='tmux -2'
alias treload='tmux source-file ~/.tmux.conf'

# Docker
alias dcom='docker-compose'

# Vagrant
alias vu='vagrant up'
alias vs='vagrant ssh'
alias vr='vagrant reload'
alias vh='vagrant halt'
alias vp='vagrant provision'
alias vd='vagrant destroy'

# Ruby
alias be='bundle exec'
alias rs='bundle exec rails s -b=0.0.0.0'
alias rc='bundle exec rails c'
alias rr='bundle exec rails routes'
alias bi='bundle install'
alias sinatra='bundle exec ruby app.rb -o0.0.0.0'

case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    if type eza > /dev/null; then
      alias ls='eza --group-directories-first --icons'
    fi
    alias l='ls -a'
    alias ll='ls -l --git'
    alias la='ls -a -G'
    alias tree='eza -T --icons'
    alias clip="pbcopy"
    alias tomcat-start='/usr/local/tomcat/bin/startup.sh'  #起動コマンド
    alias tomcat-shutdown='/usr/local/tomcat/bin/shutdown.sh'  #終了コマンド
    alias tomcat-version='/usr/local/tomcat/bin/version.sh' #バージョンコマンド
    alias ncpu='cat /proc/cpuinfo | grep processor | wc -l'
    ;;
  linux*)
    # Linux用の設定
    alias la='ls -A --color=auto'
    alias ll='ls -alF --color=auto'
    alias l='ls -CF --color=auto'
    alias ls='ls --color=auto'
    alias ncpu='cat /proc/cpuinfo | grep processor | wc -l'
    ;;
  cygwin*)
    # cygwin用の設定
    alias la='ls -A --color=auto'
    alias ll='ls -alF --color=auto'
    alias l='ls -CF --color=auto'
    alias ls='ls --color=auto'

    alias csc='/cygdrive/c/WINDOWS/MICROSOFT.NET/Framework/v4.0.30319/csc'
    alias python='python3'
    alias python_x='run xwin-multiwindow && export DISPLAY=:0.0'
    alias open='cygstart'
    ;;
esac


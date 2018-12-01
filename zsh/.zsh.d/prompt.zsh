case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    ip=`netstat -rn | grep /32 | grep -F -v '.1/32' | grep -v -E '^f|255' | cut -d/ -f1`
    ;;
  linux*)
    # Linux用の設定
    ip=`hostname -I | cut -f1 -d' '`
    ;;
  cygwin*)
    # cygwin用の設定
    ip=`hostname -I | cut -f1 -d' '`
    ;;
esac
PROMPT='%F{cyan}[%n@%m:%f%F{yello}%~%f%F{cyan}]%f %F{green}[$ip]%f
%B%(?,%F{magenta},%F{red})%(!,#,❯)%b '

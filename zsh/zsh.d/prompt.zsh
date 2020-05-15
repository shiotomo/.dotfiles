# case ${OSTYPE} in
#   darwin*)
#     # MacOS用の設定
#     ip=`ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
#     ;;
#   linux*)
#     # Linux用の設定
#     ip=`hostname -I | cut -f1 -d' '`
#     ;;
#   cygwin*)
#     # cygwin用の設定
#     ip=`hostname -I | cut -f1 -d' '`
#     ;;
# esac
# PROMPT='%F{cyan}[%n@%m:%f%F{yello}%~%f%F{cyan}]%f %F{green}[$ip]%f
# %B%(?,%F{magenta},%F{red})%(!,#,>>)%b '
PROMPT='%F{cyan}[%n@%m:%f%F{yello}%~%f%F{cyan}]%f
%B%(?,%F{magenta},%F{red})%(!,#,>>)%b '

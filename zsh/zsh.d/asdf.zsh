# if type nvim > /dev/null; then
#  case ${OSTYPE} in
#    darwin*)
#      # MacOS用の設定
#      . $(brew --prefix asdf)/libexec/asdf.sh
#      . ~/.asdf/plugins/java/set-java-home.zsh
#      ;;
#    linux*)
#      # Linux用の設定
#      # asdf
#      . $HOME/.asdf/asdf.sh
#      fpath=(${ASDF_DIR}/completions $fpath)
#      ;;
#  esac
# fi
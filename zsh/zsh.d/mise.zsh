case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    # eval "$(/usr/local/bin/mise activate zsh)"
    eval "$(/opt/homebrew/bin/mise activate zsh)"
    ;;
  linux*)
    # Linux用の設定
    eval "$(~/.local/bin/mise activate zsh)"
    ;;
esac

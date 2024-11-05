case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    # eval "$(/usr/local/bin/mise activate zsh)"
    local arch=$(uname -m)
    if [ $arch = "x86_64" ]; then
      eval "$(/usr/local/bin/mise activate zsh)"
    else
      eval "$(/opt/homebrew/bin/mise activate zsh)"
    fi
    ;;
  linux*)
    # Linux用の設定
    eval "$(~/.local/bin/mise activate zsh)"
    ;;
esac

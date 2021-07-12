case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    . $(brew --prefix asdf)/asdf.sh
    ;;
  linux*)
    # Linux用の設定
    . $HOME/.asdf/asdf.sh
    fpath=(${ASDF_DIR}/completions $fpath)
    ;;
esac

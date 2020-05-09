case ${OSTYPE} in
  darwin*)
    # MacOS用の設定
    function chpwd() { ls -G }
    ;;
  linux*)
    # Linux用の設定
    function chpwd() { ls --color=auto }
    ;;
  cygwin*)
    # cygwin用の設定
    function chpwd() { ls --color=auto }
    ;;
esac

function gi() {
  curl -L -s https://www.gitignore.io/api/$@;
}

function texc() {
  docker run --rm -v `pwd`:/workdir paperist/alpine-texlive-ja ptex2pdf -l $1
}

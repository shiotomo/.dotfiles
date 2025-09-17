export LANG=ja_JP.UTF-8
export LSCOLORS=bxfxcxdxbxegedabagacad
export PATH="$HOME/bin:$PATH"
export PATH="$PATH:/usr/local/share/git-core/contrib/diff-highlight"
export PATH="$PATH:/usr/local/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
if type nvim > /dev/null; then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

export EXA_COLORS='da=1;34:gm=1;34:di=1;36'


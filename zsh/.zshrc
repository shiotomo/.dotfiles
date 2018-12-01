#=== zshrc ====

bindkey -e
bindkey "^I" menu-complete

# === Zplug ===
source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"

zplug check || zplug install
zplug load --verbose
# =============

cdpath=(~)

ZSHDHOME="${HOME}/.dotfiles/zsh/.zsh.d"

if [ -d $ZSHDHOME -a -r $ZSHDHOME -a -x $ZSHDHOME ]; then
  for i in $ZSHDHOME/*; do
    [[ ${i##*/} = *.zsh ]] &&
      [ \( -f $i -o -h $i \) -a -r $i ] && . $i
  done
fi

# fzfの設定
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

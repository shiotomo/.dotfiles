#=== zshrc ====

bindkey -e
bindkey "^I" menu-complete

cdpath=(~)

ZSHHOME="${HOME}/.zsh_local/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
  -x $ZSHHOME ]; then
for i in $ZSHHOME/*; do
  [[ ${i##*/} = *.zsh ]] &&
    [ \( -f $i -o -h $i \) -a -r $i ] && . $i
done
fi

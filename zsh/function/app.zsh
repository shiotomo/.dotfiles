app() {
  readonly app_name=`exa /Applications | fzf`
  open -a $app_name
}

# precmd () {
#   vcs_info
# }

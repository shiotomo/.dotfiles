zsh-performance() {
  time ( zsh -i -c exit )
}

zsh-startuptime() {
  local total_msec=0
  local msec
  local i
  for i in $(seq 1 10); do
    msec=$((TIMEFMT='%mE'; time zsh -i -c exit) 2>/dev/stdout >/dev/null)
    msec=$(echo $msec | tr -d "ms")
    echo "${(l:2:)i}: ${msec} [ms]"
    total_msec=$(( $total_msec + $msec ))
  done
  local average_msec
  average_msec=$(( ${total_msec} / 10 ))
  echo "\naverage: ${average_msec} [ms]"
}

function zsh-startuptime-slower-than-default() {
  local time_rc
  time_rc=$((TIMEFMT="%mE"; time zsh -i -c exit) &> /dev/stdout)
  # time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c exit) &> /dev/stdout)
  # compinit is slow
  local time_norc
  time_norc=$((TIMEFMT="%mE"; time zsh -df -i -c "autoload -Uz compinit && compinit -C; exit") &> /dev/stdout)
  echo "my zshrc: ${time_rc}\ndefault zsh: ${time_norc}\n"

  local result
  result=$(scale=3 echo "${time_rc%ms} / ${time_norc%ms}" | bc)
  echo "${result}x slower your zsh than the default."
}

function zsh-profiler() {
  ZSHRC_PROFILE=1 zsh -i -c zprof
}

function nvim-startuptime() {
  local file=$1
  local total_msec=0
  local msec
  local i
  for i in $(seq 1 10); do
    msec=$({(TIMEFMT='%mE'; time nvim --headless -c q $file ) 2>&3;} 3>/dev/stdout >/dev/null)
    msec=$(echo $msec | tr -d "ms")
    echo "${(l:2:)i}: ${msec} [ms]"
    total_msec=$(( $total_msec + $msec ))
  done
  local average_msec
  average_msec=$(( ${total_msec} / 10 ))
  echo "\naverage: ${average_msec} [ms]"
}

function nvim-startuptime-slower-than-default() {
  local file=$1
  local time_file_rc
  time_file_rc=$(mktemp --suffix "_nvim_startuptime_rc.txt")
  local time_rc
  time_rc=$(nvim --headless --startuptime ${time_file_rc} -c "quit" $file > /dev/null && tail -n 1 ${time_file_rc} | cut -d " " -f1)

  local time_file_norc
  time_file_norc=$(mktemp --suffix "_nvim_startuptime_norc.txt")
  local time_norc
  time_norc=$(nvim --headless --noplugin -u NONE --startuptime ${time_file_norc} -c "quit" $file > /dev/null && tail -n 1 ${time_file_norc} | cut -d " " -f1)

  echo "my vimrc: ${time_rc}s\ndefault neovim: ${time_norc}s\n"
  local result
  result=$(scale=3 echo "${time_rc} / ${time_norc}" | bc)
  echo "${result}x slower your Neovim than the default."
}

function nvim-profiler() {
  local file=$1
  local time_file
  time_file=$(mktemp --suffix "_nvim_startuptime.txt")
  echo "output: $time_file"
  time nvim --headless --startuptime $time_file -c q $file
  tail -n 1 $time_file | cut -d " " -f1 | tr -d "\n" && echo " [ms]\n"
  cat $time_file | sort -n -k 2 | tail -n 20
}

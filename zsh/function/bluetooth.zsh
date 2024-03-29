bt() {
  local op=$(echo -e "connect\ndisconnect" | fzf +m)
  test -z "$op" && return 0
  local selected=$(BluetoothConnector 2>&1 | grep -o '.* - .*' | fzf +m -d ' - ' --with-nth=2)
  test -z "$selected" && return 0
  local mac_addr=$(echo $selected | cut -d ' ' -f1)
  BluetoothConnector --$op $mac_addr --notify
}

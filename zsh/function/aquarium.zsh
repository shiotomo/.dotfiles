aquarium() {
  local TARGET_DIR="$HOME/aquarium"

  # Ultimate優先
  if open -Ra "IntelliJ IDEA Ultimate" >/dev/null 2>&1; then
    idea "$TARGET_DIR"
  elif open -Ra "DataGrip" >/dev/null 2>&1; then
  # DataGrip fallback
    datagrip "$TARGET_DIR"
  # Communityは使わない（スキップ）
  else
    echo "IntelliJ IDEA Ultimate / DataGrip が見つかりません"
    return 1
  fi
}


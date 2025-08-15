#!/bin/bash
set -euo pipefail

# code コマンド存在チェック
if ! command -v code >/dev/null 2>&1; then
  echo "Error: 'code' コマンドが見つかりません。VS Code のコマンドラインツールを有効化してください。"
  exit 1
fi

pkg_list=(

  # ===== 言語パック・キーバインド =====
  # 日本語化
  MS-CEINTL.vscode-language-pack-ja
  # Vimキーバインド操作
  vscodevim.vim
  # IntelliJ IDEA 風キーバインド
  k--kato.intellij-idea-keybindings

  # ===== コード品質・整形 =====
  # ESLint（JavaScript/TypeScriptコード品質チェック）
  dbaeumer.vscode-eslint
  # Prettier（コード自動整形）
  esbenp.prettier-vscode
  # 英単語スペルチェック
  streetsidesoftware.code-spell-checker
  # コメント色分け（TODOやNOTEを見やすく）
  aaron-bond.better-comments
  # インデントを色分け表示
  oderwat.indent-rainbow
  # 末尾スペース可視化
  shardulm94.trailing-spaces
  # エラー・警告をインライン表示
  usernamehw.errorlens

  # ===== 言語サポート =====
  # Pythonサポート
  ms-python.python
  # C++サポート
  ms-vscode.cpptools
  # Goサポート
  ms-vscode.Go
  # YAMLサポート
  redhat.vscode-yaml
  # Babel/JSXサポート
  mgmcdermott.vscode-language-babel
  # Prisma ORM サポート
  Prisma.prisma
  # GraphQLサポート
  GraphQL.vscode-graphql

  # ===== UI・アイコン =====
  # VSCode用アイコンテーマ
  vscode-icons-team.vscode-icons

  # ===== 開発ツール =====
  # Docker統合管理
  ms-azuretools.vscode-docker
  # HTTPリクエスト送信（Postman代替）
  humao.rest-client
  # GUIベースAPIテストツール
  rangav.vscode-thunder-client
  # Git履歴可視化ツール
  mhutchie.git-graph
  # Gitの詳細情報表示（Git blameなど）
  eamodio.gitlens
  # HTML/XMLタグ自動リネーム
  formulahendry.auto-rename-tag
  # HTML/XMLタグ自動補完
  formulahendry.auto-close-tag
)

for ext in "${pkg_list[@]}"; do
  if code --list-extensions | grep -q "^${ext}$"; then
    echo "✔ ${ext} は既にインストール済み"
  else
    echo "➜ インストール中: ${ext}"
    code --install-extension "$ext" || echo "⚠ ${ext} のインストールに失敗しました"
  fi
done

# macOS PressAndHold無効化（Vimやキーリピートが効きやすくなる）
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled || true

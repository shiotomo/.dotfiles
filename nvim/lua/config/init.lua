-- leader key の設定
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 非推奨メッセージを無効化
-- プラグイン側の非推奨メッセージ対応用
vim.deprecate_disable = true

-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

require('config.lazy')
require('config.common')
require('config.language')
local _, _ = pcall(require, 'extension')

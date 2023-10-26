-- leader key の設定
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_guide_size = true
vim.g.vim_json_syntax_conceal = false

require('plugins')
require('common')
require('language')

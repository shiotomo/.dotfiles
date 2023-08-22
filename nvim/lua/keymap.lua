-- leader key の設定
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jj', '<ESC> `^')
vim.keymap.set('i', '\'', '\'\'<LEFT>')
vim.keymap.set('i', '\"', '\"\"<LEFT>')
vim.keymap.set('i', '(', '()<LEFT>')
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '(<C-j>', '<ESC> `^')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<C-j><C-j>', '<cmd>noh<CR>')
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR><ESC>')
vim.keymap.set('n', '==', 'gg=G')
vim.keymap.set('n', '+', '<C-a')
vim.keymap.set('n', '-', '<C-x')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv|')
vim.keymap.set('v', '<C-j>', '<ESC>')

vim.cmd [[nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>]]

vim.keymap.set({'n', 'v'}, ';;', '<cmd>w<CR>', { silent = true })

-- QuickFixのショートカットキーを設定
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>copen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>cclose<CR>', { noremap = true })

-- QuickFixウィンドウでの移動をキーバインドする場合（オプション）
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>cnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>cprev<CR>', { noremap = true })

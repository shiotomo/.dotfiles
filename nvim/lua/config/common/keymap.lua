vim.keymap.set('i', 'jj', '<ESC> `^')
vim.keymap.set('i', '<C-j>', '<ESC> `^')
vim.keymap.set('v', '<C-j>', '<ESC>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '==', 'gg=G')
vim.keymap.set('n', '+', '<C-a')
vim.keymap.set('n', '-', '<C-x')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv|')
vim.keymap.set({'n', 'v'}, ';;', '<cmd>w<CR>', { silent = true })

-- 行頭、行末 移動
vim.keymap.set({'n', 'v'}, '<S-h>', '0')
vim.keymap.set({'n', 'v'}, '<S-l>', '$')

-- 検索
vim.cmd [[nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>]]
vim.keymap.set('n', '<C-j><C-j>', '<cmd>noh<CR>')
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR><ESC>')

-- QuickFixのショートカットキーを設定
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>copen<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>Q', '<cmd>cclose<CR>', { noremap = true })

-- QuickFixウィンドウでの移動をキーバインドする場合（オプション）
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>cnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>cprev<CR>', { noremap = true })

-- window 分割
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { silent = true })
vim.keymap.set('n', '<leader>-', '<cmd>split<CR>', { silent = true })

-- window 移動
vim.keymap.set('n', '<leader>h', '<C-w><C-h>', { silent = true })
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { silent = true })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { silent = true })
vim.keymap.set('n', '<leader>l', '<C-w><C-l>', { silent = true })
vim.keymap.set('n', '<leader><Left>', '<C-w><C-h>', { silent = true })
vim.keymap.set('n', '<leader><Down>', '<C-w><C-j>', { silent = true })
vim.keymap.set('n', '<leader><Up>', '<C-w><C-k>', { silent = true })
vim.keymap.set('n', '<leader><Right>', '<C-w><C-l>', { silent = true })

-- 補完系
vim.keymap.set('i', '\'', '\'\'<LEFT>')
vim.keymap.set('i', '\"', '\"\"<LEFT>')
-- vim.keymap.set('i', '(', '()<LEFT>')
-- vim.keymap.set('i', '{', '{}<LEFT>')
-- vim.keymap.set('i', '[', '[]<LEFT>')


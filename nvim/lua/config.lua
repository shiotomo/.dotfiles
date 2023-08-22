-- keymap
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

-- set
vim.opt.ambiwidth = 'single'
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.belloff = 'all'
vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = '80,100'
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.cursorline = true
vim.opt.encoding = 'UTF-8'
vim.opt.expandtab = true
vim.opt.foldcolumn = "1"
vim.opt.hidden = true
vim.opt.history = 5000
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.re = 1
vim.opt.ruler = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.ttyfast = true
vim.opt.wildmenu = true
vim.opt.wrap = true

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

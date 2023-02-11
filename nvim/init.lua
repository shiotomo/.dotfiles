vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  use 'puremourning/vimspector'
  use 'ConradIrwin/vim-bracketed-paste'
  use 'Shougo/neosnippet-snippets'
  use 'Shougo/neosnippet.vim'
  use 'Shougo/unite.vim'
  use 'Shougo/vimproc.vim'
  use 'Shougo/vimshell.vim'
  use 'Yggdroot/indentLine'
  use 'aklt/plantuml-syntax'
  use 'altercation/vim-colors-solarized'
  use 'aonemd/kuroi.vim'
  use 'basyura/unite-rails'
  use 'bronson/vim-trailing-whitespace'
  use 'chr4/nginx.vim'
  use 'derekwyatt/vim-scala'
  use 'elzr/vim-json'
  use 'hail2u/vim-css3-syntax'
  use 'itchyny/calendar.vim'
  use 'itchyny/vim-gitbranch'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'jelera/vim-javascript-syntax'
  use 'junegunn/fzf.vim'
  use 'kannokanno/previm'
  use 'kchmck/vim-coffee-script'
  use 'leafgarland/typescript-vim'
  use 'mattn/emmet-vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'mbbill/undotree'
  use 'othree/es.next.syntax.vim'
  use 'othree/html5.vim'
  use 'scrooloose/nerdtree'
  use 'scrooloose/syntastic'
  use 'slim-template/vim-slim'
  use 'thinca/vim-quickrun'
  use 'tomtom/tcomment_vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tyru/open-browser.vim'
  use 'udalov/kotlin-vim'
  use 'w0ng/vim-hybrid'
  use 'ryanoasis/vim-devicons'
  use 'folke/tokyonight.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'williamboman/mason.nvim'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'nvim-lua/lsp-status.nvim'
end)

-- colorscheme
vim.cmd [[colorscheme tokyonight]]

-- lsp
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(
    --   vim.lsp.protocol.make_client_capabilities()
    -- )
  }
  require('lspconfig')[server].setup(opt)
end })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
-- vim.lsp.diagnostic.on_publish_diagnostics, {
--   update_in_insert = false,
--   virtual_text = {
--     format = function(diagnostic)
--       return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
--     end,
--   },
-- }
)
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
autocmd!
autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    -- ['<C-e>']  = cmp.mapping.abort(),
    ['<CR>']  = cmp.mapping.confirm { select = true },
    ['<C-f>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
-- lsp hover
local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    vim.diagnostic.open_float()
  end
end
local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
local function enable_diagnostics_hover()
  vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })
end
local function disable_diagnostics_hover()
  vim.api.nvim_clear_autocmds({ group = diagnostic_hover_augroup_name })
end
vim.api.nvim_set_option('updatetime', 500)
enable_diagnostics_hover()
local function on_hover()
  disable_diagnostics_hover()
  vim.lsp.buf.hover()
  vim.api.nvim_create_augroup("lspconfig-enable-diagnostics-hover", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { group = "lspconfig-enable-diagnostics-hover", callback = function()
    vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
    enable_diagnostics_hover()
  end })
end

-- keymap
vim.keymap.set('i', 'jj', '<ESC> `^')
vim.keymap.set('i', '\'', '\'\'<LEFT>')
vim.keymap.set('i', '\"', '\"\"<LEFT>')
vim.keymap.set('i', '(', '()<LEFT>')
vim.keymap.set('i', '{', '{}<LEFT>')
vim.keymap.set('i', '[', '[]<LEFT>')
vim.keymap.set('i', '(<C-j>', '<ESC> `^')

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<C-j><C-j>', ':noh<CR>')
vim.keymap.set('n', '<ESC><ESC>', ':noh<CR><ESC>')
vim.keymap.set('n', '<C-e>', ':NERDTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '==', 'gg=G')
vim.keymap.set('n', '+', '<C-a')
vim.keymap.set('n', '-', '<C-x')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<Leader>lk', on_hover)
vim.cmd [[nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>]]

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv|')
vim.keymap.set('v', '<C-j>', '<ESC>')

-- set
vim.opt.colorcolumn = '80,100'
vim.opt.ambiwidth = double
vim.opt.autoindent = true
vim.opt.background = dark
vim.opt.backspace = 'indent,eol,start'
vim.opt.belloff = all
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = menuone, noinsert
vim.opt.cursorline = true
vim.opt.encoding = 'UTF-8'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.history = 5000
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.number = true
vim.opt.re = 1
vim.opt.ruler = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.ttyfast = true
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.mouse = 'a'

-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

vim.g.NERDTreeShowHidden = true
vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_guide_size = true
vim.g.vim_json_syntax_conceal = false

-- status line
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'filename' },
    lualine_c = { 'branch', 'diff', 'diagnostics' },
    lualine_x = { "require('lsp-status').status()" },
    lualine_y = { 'encoding', 'filetype' },
    lualine_z = { 'location' }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


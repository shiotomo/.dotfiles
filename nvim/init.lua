local vim = vim

vim.cmd.packadd "packer.nvim"

require('packer').startup(function(use)
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
  use 'voldikss/vim-floaterm'
  use 'nvim-treesitter/nvim-treesitter'
  use 'dinhhuy258/git.nvim'
  use 'nvim-lua/lsp-status.nvim'

  -- lsp
  use 'williamboman/mason.nvim'
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason-lspconfig.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'hrsh7th/vim-vsnip-integ'

  -- cmp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
end)

-- ファイルを開いた時に、カーソルの場所を復元する
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- leader key の設定
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- colorscheme
vim.g.colors_name = "tokyonight"

-- lsp
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(_, bufnr)
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
)

-- lsp saga
require('lspsaga').setup({
  lightbulb = {
    sign = false,
  },
  use_saga_diagnostic_sign = false,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  dianostic_header_icon = '   ',
  code_action_icon = ' ',
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 40,
    virtual_text = true
  },
  code_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    exec = '<CR>',
    scroll_down = '<C-n>',
    scroll_up = '<C-p>'
  },
  code_action_lightbulb = {
    enable = false,
  },
  border_style = 1,
  max_preview_lines = 10,
  finder_definition_icon = '  ',
  finder_reference_icon = '  ',
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = '<C-n>',
    scroll_up = '<C-p>'
  }
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
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" },
    {
      group = "lspconfig-enable-diagnostics-hover",
      callback = function()
        vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
        enable_diagnostics_hover()
      end
    })
end

-- cmp
local cmp = require("cmp")
cmp.setup.buffer {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
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
  options = {
    keyword_length = 1
  }
}
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- telescope
local builtin = require('telescope.builtin')
require('telescope').setup {
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

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
    lualine_b = {
      'branch',
      'diff',
      {
        'diagnostics',
        sources = {
          'nvim_lsp'
        },
        symbols = {
          error = ' ',
          warn  = ' ',
          info  = ' ',
          hint  = ' '
        },
      }
    },
    lualine_z = { 'location' }
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

-- git
require('git').setup({
  default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  -- target_branch = "master",
})

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
vim.keymap.set('n', '<C-j><C-j>', '<cmd>noh<CR>')
vim.keymap.set('n', '<ESC><ESC>', '<cmd>noh<CR><ESC>')
vim.keymap.set('n', '<C-e>', '<cmd>NERDTreeToggle<CR>', { silent = true })
vim.keymap.set('n', '==', 'gg=G')
vim.keymap.set('n', '+', '<C-a')
vim.keymap.set('n', '-', '<C-x')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>t', '<cmd>FloatermNew<CR>')
vim.cmd [[nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>]]

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv|')
vim.keymap.set('v', '<C-j>', '<ESC>')

vim.keymap.set({'n', 'v'}, ';;', '<cmd>w<CR>', { silent = true })

-- lsp keymap
-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>',
  { noremap = true, silent = true })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<Leader>lk', on_hover)

-- lsp saga keymap
vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")

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

vim.g.NERDTreeShowHidden = true
vim.g.indent_guides_enable_on_vim_startup = true
vim.g.indent_guides_guide_size = true
vim.g.vim_json_syntax_conceal = false

-- Markdownファイルに対する設定
vim.api.nvim_exec([[
  augroup markdownSyntax
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2
  augroup END
]], false)


-- plugin
vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
  -- 起動時に読み込むプラグインを書いてください。
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
  -- use 'fatih/vim-go', { ['do'] = ':GoUpdateBinaries' }
  use 'hail2u/vim-css3-syntax'
  use 'itchyny/calendar.vim'
  use 'itchyny/lightline.vim'
  use 'itchyny/vim-gitbranch'
  use 'jelera/vim-javascript-syntax'
  -- use 'junegunn/fzf', { ['do'] = vim.fn['fzf#install()'] }
  use 'junegunn/fzf.vim'
  use 'kannokanno/previm'
  use 'kchmck/vim-coffee-script'
  use 'leafgarland/typescript-vim'
  use 'mattn/emmet-vim'
  use 'maxmellon/vim-jsx-pretty'
  use 'mbbill/undotree'
  -- use 'neoclide/coc.nvim', {'branch': 'release'}
  use 'othree/es.next.syntax.vim'
  use 'othree/html5.vim'
  -- use 'pangloss/vim-javascript', { ['for']: ['javascript', 'javascript.jsx'] }
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
end)

-- keymap
vim.keymap.set('i', 'jj', '<ESC> `^')

-- set
-- vim.opt.colorcolumn = 80,100
-- vim.opt.termwinsize = 20x0
vim.opt.ambiwidth=double
vim.opt.autoindent = true
vim.opt.background = dark
vim.opt.backspace=indent,eol,start
vim.opt.belloff = all
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = menuone
vim.opt.completeopt=menuone,noinsert
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
-- vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.shiftwidth = 2
vim.opt.showmatch = true
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.swapfile = false
-- vim.opt.t_Co = 256
vim.opt.tabstop = 2
vim.opt.ttyfast = true
vim.opt.wildmenu = true
vim.opt.wrap = false

-- vim.api.nvim_command [[colorscheme hybrid]]

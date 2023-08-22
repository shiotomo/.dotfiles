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
  use 'onsails/lspkind.nvim'

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
end)

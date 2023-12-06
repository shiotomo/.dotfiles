local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'ConradIrwin/vim-bracketed-paste'
  },
  {
    'Shougo/neosnippet-snippets'
  },
  {
    'Shougo/neosnippet.vim'
  },
  {
    'Yggdroot/indentLine'
  },
  {
    'aklt/plantuml-syntax'
  },
  -- {
  --   'aonemd/kuroi.vim'
  -- },
  {
    'bronson/vim-trailing-whitespace'
  },
  {
    'chr4/nginx.vim'
  },
  {
    'derekwyatt/vim-scala'
  },
  {
    'itchyny/calendar.vim'
  },
  {
    'itchyny/vim-gitbranch'
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  },
  {
    'junegunn/fzf.vim'
  },
  {
    'kannokanno/previm'
  },
  {
    'mbbill/undotree'
  },
  {
    'scrooloose/nerdtree'
  },
  {
    'scrooloose/syntastic'
  },
  {
    'tpope/vim-fugitive'
  },
  {
    'tpope/vim-surround'
  },
  {
    'tyru/open-browser.vim'
  },
  -- {
  --   'w0ng/vim-hybrid'
  -- },
  {
    'ryanoasis/vim-devicons'
  },
  {
    'folke/tokyonight.nvim'
  },
  {
    'akinsho/toggleterm.nvim'
  },
  {
    'sindrets/diffview.nvim'
  },
  {
    'nvim-treesitter/nvim-treesitter'
  },
  {
    'dinhhuy258/git.nvim'
  },
  {
    'akinsho/git-conflict.nvim'
  },
  {
    'lewis6991/gitsigns.nvim'
  },
  {
    'nvim-lua/lsp-status.nvim'
  },
  {
    'hrsh7th/nvim-insx'
  },
  {
    'folke/neodev.nvim'
  },
  {
    'vim-jp/vimdoc-ja',
    lazy = true,
    keys = {
      { "h", mode = "c", },
    },
  },

  -- lsp
  {
    'williamboman/mason.nvim'
  },
  {
    'wbthomason/packer.nvim'
  },
  {
    'neovim/nvim-lspconfig'
  },
  {
    'williamboman/mason-lspconfig.nvim'
  },
  {
    'glepnir/lspsaga.nvim'
  },
  {
    'hrsh7th/vim-vsnip-integ'
  },

  -- cmp
  {
    'hrsh7th/nvim-cmp'
  },
  {
    'hrsh7th/cmp-nvim-lsp'
  },
  {
    'hrsh7th/vim-vsnip'
  },
  {
    'hrsh7th/cmp-vsnip'
  },
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'onsails/lspkind.nvim'
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
      }
  },
  {
    'petertriho/nvim-scrollbar'
  },

  -- telescope
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'renerocksai/telekasten.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    }
  },

  -- dap
  {
    'mfussenegger/nvim-dap'
  },
  {
    'jay-babu/mason-nvim-dap.nvim'
  },
  {
    'rcarriga/nvim-dap-ui'
  },
  {
    'theHamsta/nvim-dap-virtual-text'
  },
  --  'microsoft/vscode-js-debug'
  --  'mxsdev/nvim-dap-vscode-js'
  {
    'mxsdev/nvim-dap-vscode-js',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  {
    'microsoft/vscode-js-debug',
    -- opt = true,
    version = "v1.74.1",
    pin = true,
    run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
  }
})

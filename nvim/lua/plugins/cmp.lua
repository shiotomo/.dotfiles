return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'yamatsum/nvim-nonicons',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'mortepau/codicons.nvim',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = "InsertEnter",
    config = function()
      -- cmp
      local cmp = require("cmp")
      local lspkind = require 'lspkind'
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
          { name = "buffer" },
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
        },
        -- Lspkind(アイコン)を設定
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          })
        }
      }

      -- lspkindの設定
      lspkind.init({
        -- DEPRECATED (use mode instead): enables text annotations
        --
        -- default: true
        -- with_text = true,

        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',

        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',

        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
        type = {
          Array = "",
          Number = "",
          String = "",
          Boolean = "蘒",
          Object = "",
        },
        documents = {
          File = "",
          Files = "",
          Folder = "",
          OpenFolder = "",
        },
        git = {
          Add = "",
          Mod = "",
          Remove = "",
          Ignore = "",
          Rename = "",
          Diff = "",
          Repo = "",
        },
        ui = {
          Lock = "",
          Circle = "",
          BigCircle = "",
          BigUnfilledCircle = "",
          Close = "",
          NewFile = "",
          Search = "",
          Lightbulb = "",
          Project = "",
          Dashboard = "",
          History = "",
          Comment = "",
          Bug = "",
          Code = "",
          Telescope = "",
          Gear = "",
          Package = "",
          List = "",
          SignIn = "",
          Check = "",
          Fire = "",
          Note = "",
          BookMark = "",
          Pencil = "",
          -- ChevronRight = "",
          ChevronRight = ">",
          Table = "",
          Calendar = "",
        },
        diagnostics = {
          Error = "",
          Warning = "",
          Information = "",
          Question = "",
          Hint = "",
        },
        misc = {
          Robot = "ﮧ",
          Squirrel = "",
          Tag = "",
          Watch = "",
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/vim-vsnip',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/cmp-vsnip',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/cmp-buffer',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/cmp-path',
    lazy = true,
    event = "InsertEnter",
  },
  {
    'hrsh7th/vim-vsnip-integ',
  },
  {
    'onsails/lspkind.nvim',
    lazy = true,
    event = "InsertEnter",
    config = function()
    end
  },
}

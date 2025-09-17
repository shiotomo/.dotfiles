return {
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = 'enter',
      },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        -- メニューの安定性向上
        menu = {
          border = 'rounded',
          -- 高さ制限でインデックスエラー防止
          max_height = 15,
        },
        list = {
          -- アイテム数制限
          max_items = 200,
        }
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          buffer = {
            max_items = 50,
            -- 短いキーワードは無視
            min_keyword_length = 2,
          },
          lsp = {
            max_items = 100,
          }
        }
      },

      fuzzy = {
        implementation = "lua"
      }
    },
    opts_extend = { "sources.default" }
  },
}

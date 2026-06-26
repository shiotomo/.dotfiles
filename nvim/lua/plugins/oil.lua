return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- アイコン表示用（任意）
    config = function()
      require("oil").setup({
        -- デフォルトのキーマッピング（必要に応じてカスタマイズ可能）
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        -- ウィンドウの設定
        view_options = {
          -- ドットファイル（非表示ファイル）をデフォルトで表示するかどうか
          show_hidden = false,
        },
        -- ─── フローティングウィンドウの設定を追加 ───
        float = {
          padding = 5,            -- 画面端からの余白
          max_width = 160,         -- ウィンドウの最大幅
          max_height = 50,        -- ウィンドウの最大高さ
          border = "double",     -- 枠線のスタイル（"rounded", "single", "double" など）
          win_options = {
            winblend = 0,        -- ウィンドウの透過度（0で完全不透明、大体10前後が綺麗です）
          },
        },
      })

      -- フローティングウィンドウとして開く設
      vim.keymap.set("n", "<Leader>e", function()
        require("oil").open_float()
      end, { desc = "Open Oil" })
    end,
  }
}

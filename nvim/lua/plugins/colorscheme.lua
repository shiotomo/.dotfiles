return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     require("tokyonight").setup({
  --       transparent = true,
  --       styles = {
  --         sidebars = "transparent",
  --         floats = "transparent",
  --       },
  --     })
  --     vim.g.colors_name = "tokyonight-moon"
  --     vim.cmd [[colorscheme tokyonight-moon]]
  --   end
  -- },
  {
    "Shatur/neovim-ayu",
    lazy = false,      -- 起動時に即ロード（colorschemeはこれ推奨）
    priority = 1000,   -- 他のUI系より先に読み込む
    config = function()
      require("ayu").setup({
        mirage = true,
        overrides = {},
        terminal = true,
        theme = "mirage", -- "dark" | "mirage" | "light"
        highlights = {
          Normal = { bg = "None" },          -- 透過したい場合
          NormalFloat = { bg = "None" },
          FloatBorder = { fg = "comment" },
        },
      })

      vim.cmd("colorscheme ayu")

      -- ayu推奨オプション
      vim.o.termguicolors = true
    end,
  }
}

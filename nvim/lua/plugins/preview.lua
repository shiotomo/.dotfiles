return {
  {
    "OXY2DEV/markview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = "markdown", -- markdown を開いたときだけロード
    config = function()
      require("markview").setup({
        preview = {
          enable = false,
          filetypes = { "markdown" },
          splitview_winopts = {
            split = "right",
          },
        },
      })
      vim.keymap.set('n', '<leader>p', '<cmd>Markview<CR>', { silent = true })
    end,
  },
  {
    'kannokanno/previm'
  },
}

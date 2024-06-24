return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.g.colors_name = "tokyonight-moon"
    vim.cmd [[colorscheme tokyonight-moon]]
  end
}

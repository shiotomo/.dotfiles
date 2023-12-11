return {
  'folke/tokyonight.nvim',
  config = function()
    require("tokyonight").setup({
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.g.colors_name = "tokyonight-moon"
  end
}

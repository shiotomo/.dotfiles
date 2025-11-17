return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = function ()
      require("bufferline").setup({
        options = {
          mode = "tabs",         -- "buffers" or "tabs"
          separator_style = "thin",-- スラント境界
          diagnostics = "nvim_lsp",
          show_close_icon = true,
          show_buffer_close_icons = true,
          always_show_bufferline = true,
          offsets = {
            {
              filetype = "nerdtree",
              text = "File Explorer",
              text_align = "left",
              highlight = "Directory",
              separator = true,
            }
          },
        },
        highlights = {
          separator = {
            fg = "#073642",
            bg = "#002b36",
          },
          separator_selected = {
            fg = "#073642",
          },
          background = {
            fg = "#657b83",
            bg = "#002b36",
          },
          buffer_selected = {
            fg = "#fdf6e3",
            bold = true,
          },
          fill = {
            bg = "#073642",
          },
        },
      })
    end
  }
}

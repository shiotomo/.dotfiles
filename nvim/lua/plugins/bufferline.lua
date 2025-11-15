return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    config = Function ()
    require("bufferline").setup({
      options = {
        mode = "tabs",         -- "buffers" or "tabs"
        position = "bottom",      -- タブバーを下に配置（おしゃれ＆Neovimタブと干渉しない）
        -- separator_style = "thick",
        separator_style = "padded_slant",-- スラント境界
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
    })
  end
  }
}

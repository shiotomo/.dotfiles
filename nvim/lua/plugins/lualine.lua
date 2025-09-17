return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  event = "UIEnter",
  config = function()
    local function selectionCount()
      local mode = vim.fn.mode()
      local start_line, end_line, start_pos, end_pos

      -- 選択モードでない場合には無効
      if not (mode:find("[vV\22]") ~= nil) then return "" end
      start_line = vim.fn.line("v")
      end_line = vim.fn.line(".")

      if mode == 'V' then
        -- 行選択モードの場合は、各行全体をカウントする
        start_pos = 1
        end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
      else
        start_pos = vim.fn.col("v")
        end_pos = vim.fn.col(".")
      end

      local chars = 0
      for i = start_line, end_line do
        local line = vim.fn.getline(i)
        local line_len = vim.fn.strlen(line)
        local s_pos = (i == start_line) and start_pos or 1
        local e_pos = (i == end_line) and end_pos or line_len + 1
        chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos - 1))
      end

      local lines = math.abs(end_line - start_line) + 1
      return tostring(lines) .. " lines, " .. tostring(chars) .. " characters"
    end
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = {
              'nvim_lsp'
            },
            symbols = {
              error = "❌ ", -- クロスマーク
              warn  = "⚠️ ", -- 警告
              info  = "ℹ️ ", -- 情報
              hint  = "💡 ", -- アイデア
            }
          }
        },
        lualine_x = {
          "encoding",         -- UTF-8 など
          "fileformat",       -- unix / dos / mac
          "filetype",         -- ← これが現在のファイルタイプ
        },
        lualine_y = {
          {'searchcount'},
          {selectionCount},
        },
        lualine_z = { 'location' }
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end,
}

return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "<leader>zh",
        function()
          require("plugins.fzf").zsh_history()
        end,
        desc = "Zsh History",
      },
      {
        "<C-r>h",
        function()
          require("plugins.fzf").zsh_history()
        end,
        mode = { "i", "n" },
        desc = "Zsh History Insert",
      },
    },
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({})

      -- =========================
      -- zsh history function
      -- =========================
      local function read_zsh_history()
        -- fcコマンドを使う
        local handle = io.popen("fc -rl 1 2>/dev/null")
        local result = {}

        if handle then
          for line in handle:lines() do
            -- 先頭の番号削除
            local cmd = line:gsub("^%s*%d+%s+", "")
            if cmd ~= "" then
              table.insert(result, cmd)
            end
          end
          handle:close()
        end

        -- fallback: .zsh_history
        if #result == 0 then
          local file = os.getenv("HOME") .. "/.zsh_history"
          for line in io.lines(file) do
            local cmd = line:match("^: %d+:%d+;(.*)$")
            if cmd then
              table.insert(result, cmd)
            end
          end
        end

        return result
      end

      local function zsh_history()
        local items = read_zsh_history()

        fzf.fzf_exec(items, {
          prompt = "Zsh History> ",

          preview = function(item)
            return item
          end,

          actions = {
            ["default"] = function(selected)
              if not selected or #selected == 0 then return end

              -- 複数選択対応
              vim.api.nvim_put(selected, "c", true, true)
            end,

            ["ctrl-e"] = function(selected)
              if not selected or #selected == 0 then return end
              -- コマンド実行
              vim.fn.system(selected[1])
              vim.notify("Executed: " .. selected[1])
            end,
          },
        })
      end

      -- 外から呼べるように
      package.loaded["plugins.fzf"] = {
        zsh_history = zsh_history,
      }
    end,
  }
}

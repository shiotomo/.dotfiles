return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    event = "UIEnter",
    config = function ()
      local dap = require("dap")

      vim.keymap.set('n', '<leader>d', '<cmd>lua require("dapui").toggle()<CR>'     )
      vim.keymap.set('n', '<leader>b', '<cmd>DapToggleBreakpoint<CR>'               )
      vim.keymap.set('n', '<F5>',      ':DapContinue<CR>',         { silent = true })
      vim.keymap.set('n', '<F10>',     ':DapStepOver<CR>',         { silent = true })
      vim.keymap.set('n', '<F11>',     ':DapStepInto<CR>',         { silent = true })
      vim.keymap.set('n', '<F12>',     ':DapStepOut<CR>',          { silent = true })
      vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })

      vim.fn.sign_define("DapBreakpoint",          { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapLogPoint",            { text = "'", texthl = "DapLogPoint" }  )
      vim.fn.sign_define("DapStopped",             { text = "", texthl = "DapStopped" }   )

      -- require("dap-vscode-js").setup({
      --   debugger_path = vim.fn.expand("$MASON/bin/js-debug-adapter") .. "/extension",
      --   adapters = { "pwa-node", "pwa-chrome", "node-terminal", "pwa-extensionHost" },
      -- })

      -- dap keymap
      -- vim.keymap.set('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
      -- vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
      -- vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })
      -- typescript/javcascript
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          -- Make sure to update this path to point to your installation
          args = {
            -- require("mason-registry").get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js",
            -- vim.fn.expand("$MASON/bin/js-debug-adapter") .. "/js-debug/src/dapDebugServer.js",
            vim.fn.expand("$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"),
            -- vim.fn.expand("$MASON/bin/js-debug-adapter"),
            "${port}",
          },
        },
      }

      for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "node launch",
              name = "launch file",
              program = "${file}",
              sourceMaps = true,
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "launch",
              name = "launch ts-node",
              program = "${file}",
              rootPath = '${workspaceFolder}',
              skipFiles = { "<node_internals>/**","node_modules/**" },
              runtimeArgs = { "--nolazy", "-r", "ts-node/register" },
              sourceMaps = true,
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "launch",
              name = "launch global ts-node",
              program = "${file}",
              rootPath = '${workspaceFolder}',
              sourceMaps = true,
              cwd = "${workspaceFolder}",
              runtimeExecutable = 'ts-node',
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "attach\n",
              processId = require("dap.utils").pick_process,
              sourceMaps = true,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    lazy = true,
    event = "UIEnter",
    opts = {
      ensure_installed = {
        'js-debug-adapter',
        'python',
        'delve',
      },
      handlers = {}, -- デフォルト handler を使用（重要）
    }
  },
  {
    'rcarriga/nvim-dap-ui',
    keys = {
      { '<leader>d', '<cmd>lua require("dapui").toggle()<CR>' },
    },
    config = function ()
      local dapui = require("dapui")
      dapui.setup({
        icons = {
          collapsed = '▾',
          expanded = '▸',
          breakpoint = '',
          -- 他のアイコンに対する設定も追加できます
        },
      })
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    lazy = true,
    event = "UIEnter",
  },
  --  'microsoft/vscode-js-debug'
  --  'mxsdev/nvim-dap-vscode-js'
  {
    'mxsdev/nvim-dap-vscode-js',
    lazy = true,
    event = "UIEnter",
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },
  {
    'microsoft/vscode-js-debug',
    lazy = true,
    event = "UIEnter",
    -- opt = true,
    version = "v1.74.1",
    pin = true,
    run = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'
  },
  {
    'nvim-telescope/telescope-dap.nvim',
    lazy = true,
    event = "UIEnter",
    config = function ()
      require('telescope').load_extension('dap')
    end
  },
  {
    'nvim-neotest/nvim-nio'
  }
}

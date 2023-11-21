-- dapui
local dapui = require("dapui").setup({
  icons = {
    collapsed = '▾',
    expanded = '▸',
    breakpoint = '',
    ... -- 他のアイコンに対する設定も追加できます
  },
})

-- dap
local dap = require("dap")

-- dap.listeners.after.event_initialized["dapui_config"] = function()
--   dapui.open({})
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close({})
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close({})
-- end

-- mason-dap
require("mason-nvim-dap").setup({
  ensure_installed = {
    'python',
    'delve',
    'js-debug-adapter',
  }
})

-- dap keymap

vim.keymap.set('n', '<leader>d', '<cmd>lua require("dapui").toggle()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>DapToggleBreakpoint<CR>')
vim.keymap.set('n', '<F5>', ':DapContinue<CR>', { silent = true })
vim.keymap.set('n', '<F10>', ':DapStepOver<CR>', { silent = true })
vim.keymap.set('n', '<F11>', ':DapStepInto<CR>', { silent = true })
vim.keymap.set('n', '<F12>', ':DapStepOut<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':DapToggleBreakpoint<CR>', { silent = true })
vim.keymap.set('n', '<leader>B', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Breakpoint condition: "))<CR>', { silent = true })
vim.keymap.set('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })

-- typescript/javcascript
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- Make sure to update this path to point to your installation
    args = {
      require("mason-registry").get_package("js-debug-adapter"):get_install_path()
      .. "/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

-- for _, language in ipairs({ "javascript", "javascriptreact" }) do
for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  if not dap.configurations[language] then
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "launch",
        name = "ts-node launch",
        program = "${file}",
        rootPath = '${workspaceFolder}',
        skipFiles = { "<node_internals>/**","node_modules/**" },
        runtimeArgs = { "--nolazy", "-r", "ts-node/register" },
        cwd = "${workspaceFolder}",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
end


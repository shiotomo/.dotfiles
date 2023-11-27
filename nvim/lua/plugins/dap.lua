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
-- vim.keymap.set('n', '<leader>lp', ':lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>dr', ':lua require("dap").repl.open()<CR>', { silent = true })
-- vim.keymap.set('n', '<leader>dl', ':lua require("dap").run_last()<CR>', { silent = true })

-- typescript/javcascript
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- Make sure to update this path to point to your installation
    args = {
      require("mason-registry").get_package("js-debug-adapter"):get_install_path() .. "/js-debug/src/dapDebugServer.js",
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
        name = "attach",
        processId = require("dap.utils").pick_process,
        sourceMaps = true,
        cwd = "${workspaceFolder}",
      },
    }
  end
end


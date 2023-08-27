-- vim.keymap.set('n', '<leader>r', '<cmd>DiffviewOpen<CR>')
-- vim.keymap.set('n', '<leader>d', '<cmd>DiffviewClose<CR>')

vim.cmd("command! ReviewOpen DiffviewOpen")
vim.cmd("command! ReviewClose DiffviewClose")

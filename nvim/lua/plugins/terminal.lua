-- vim.keymap.set('n', '<leader>t', '<cmd>FloatermNew<CR>')

require("toggleterm").setup()

vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm direction=float<CR>')
-- vim.keymap.set('n', '<leader>h', '<cmd>ToggleTerm direction=horizontal<CR>')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])

vim.cmd("command! FloatT ToggleTerm direction=float")
vim.cmd("command! HorT ToggleTerm direction=horizontal")
vim.cmd("command! TabT ToggleTerm direction=tab")

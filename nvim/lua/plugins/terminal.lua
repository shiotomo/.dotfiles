return {
  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<leader>tt', '<cmd>ToggleTerm direction=float<CR>' },
      { '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>' },
      { '<leader>tv', '<cmd>ToggleTerm direction=tab<CR>' },
    },
    config = function()
      -- vim.keymap.set('n', '<leader>t', '<cmd>FloatermNew<CR>')

      require("toggleterm").setup()

      vim.cmd("command! FloatT ToggleTerm direction=float")
      vim.cmd("command! HorT ToggleTerm direction=horizontal")
      vim.cmd("command! TabT ToggleTerm direction=tab")
    end
  },
}

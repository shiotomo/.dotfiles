return {
  {
    'dinhhuy258/git.nvim',
    lazy = true,
    event = "InsertEnter",
    config = function()
      -- git
      require('git').setup({
        default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

        keymaps = {
          -- Open blame window
          blame = "<Leader>gb",
          -- Close blame window
          quit_blame = "q",
          -- Open blame commit
          blame_commit = "<CR>",
          -- Open file/folder in git repository
          browse = "<Leader>go",
          -- Open pull request of the current branch
          open_pull_request = "<Leader>gp",
          -- Create a pull request with the target branch is set in the `target_branch` option
          create_pull_request = "<Leader>gn",
          -- Opens a new diff that compares against the current index
          diff = "<Leader>gd",
          -- Close git diff
          diff_close = "<Leader>gD",
          -- Revert to the specific commit
          revert = "<Leader>gr",
          -- Revert the current file to the specific commit
          revert_file = "<Leader>gR",
        },
      })
    end
  },
  {
    'akinsho/git-conflict.nvim',
    lazy = true,
    event = "InsertEnter",
    config = function()
      require('git-conflict').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = "InsertEnter",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    event = "InsertEnter",
    config = function()
      -- vim.keymap.set('n', '<leader>r', '<cmd>DiffviewOpen<CR>')
      -- vim.keymap.set('n', '<leader>d', '<cmd>DiffviewClose<CR>')

      vim.cmd("command! ReviewOpen DiffviewOpen")
      vim.cmd("command! ReviewClose DiffviewClose")

    end
  },
  {
    'itchyny/vim-gitbranch',
    lazy = true,
    event = "InsertEnter",
  },
}

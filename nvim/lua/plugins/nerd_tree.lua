return {
  'scrooloose/nerdtree',
  keys = {
    { '<C-e>', '<cmd>NERDTreeToggle<CR>', { silent = true } }
  },
  cmd = { 'NERDTree' },
  config = function ()
    vim.g.NERDTreeShowHidden = true
    vim.g.NERDTreeCreateInTab = 0
  end,
  init = function ()
    vim.api.nvim_create_autocmd({"BufEnter"}, {
      pattern = "",
      callback = function ()
        if vim.fn.isdirectory(vim.fn.expand("%d")) == 1 then
          vim.fn.execute("NERDTree " .. vim.fn.expand("%"))
        end
      end
    })
  end
}

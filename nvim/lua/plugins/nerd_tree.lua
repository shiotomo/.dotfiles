return {
  'scrooloose/nerdtree',
  config = function()
    vim.g.NERDTreeShowHidden = true
    vim.keymap.set('n', '<C-e>', '<cmd>NERDTreeToggle<CR>', { silent = true })
  end
}

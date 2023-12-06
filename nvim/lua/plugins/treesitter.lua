require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,  -- syntax highlightを有効にする
  },
  ensure_installed = 'all', -- :TSInstall allと同じ
  -- ensure_installed = 'maintained' とすることもできる
}

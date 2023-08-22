-- Markdownファイルに対する設定
vim.api.nvim_exec([[
  augroup markdownSyntax
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
    autocmd FileType markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2
  augroup END
]], false)


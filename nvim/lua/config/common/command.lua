vim.api.nvim_create_user_command("CharCounter", function(opts)
  local column_start = vim.fn.getpos("'<")[3]
  local column_end = vim.fn.getpos("'>")[3]
  local lines = vim.fn.getline(opts.line1, opts.line2)
  local n = vim.fn.len(lines)
  if n == 1 then
    lines = { lines[1]:sub(column_start, column_end) }
  else
    lines[1] = lines[1]:sub(column_start, vim.fn.len(lines[1]))
    lines[n] = lines[1]:sub(1, column_end)
  end
  local str = vim.fn.join(lines, "")
  local count = vim.fn.strlen(vim.fn.substitute(str, ".", ".", "g"))
  vim.notify(tostring(count), vim.log.levels.INFO, { title = "Selected Chars Count" })
end, {
  range = 2,
} )

vim.api.nvim_create_user_command("PutMessage", "put =execute('messages')", {})


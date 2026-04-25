-- =========================
-- Trailing SPACE only (no tab)
-- =========================

local group = vim.api.nvim_create_augroup("TrailingSpace", { clear = true })

-- ハイライト定義
vim.api.nvim_set_hl(0, "TrailingSpace", {
  bg = "#dfc898", -- 好きな色に変更OK
})

-- namespace（match管理用）
local ns = vim.api.nvim_create_namespace("trailing_space_ns")

-- ハイライト関数
local function highlight_trailing_space()
  -- 既存のハイライト削除
  vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)

  -- Insert中は表示しない
  if vim.fn.mode() == "i" then
    return
  end

  -- スペースのみ（タブ除外）
  vim.fn.matchadd("TrailingSpace", [[ \+$]])
end

-- イベント登録
vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
  group = group,
  callback = highlight_trailing_space,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    vim.cmd("match none")
  end,
})

-- =========================
-- 保存時にスペースだけ削除
-- =========================
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = group,
--   callback = function()
--     -- カーソル位置保持
--     local save = vim.fn.winsaveview()
--
--     -- スペースのみ削除（タブは残す）
--     vim.cmd([[%s/ \+$//e]])
--
--     -- カーソル復元
--     vim.fn.winrestview(save)
--   end,
-- })

        
-- =====================================
-- :FixWhiteSpace
-- ・行末の「スペースのみ」を削除（タブは残す）
-- ・カーソル位置 / view を維持
-- ・silent & エラー抑制
-- =====================================
vim.api.nvim_create_user_command("FixWhiteSpace", function(opts)
  -- カーソル位置・スクロール状態を保存
  local view = vim.fn.winsaveview()

  -- 範囲指定対応（visualや:10,20FixWhiteSpace）
  local range = ""
  if opts.range == 2 then
    range = string.format("%d,%d", opts.line1, opts.line2)
  else
    range = "%"
  end

  -- スペースのみ削除（タブは残す）
  vim.cmd(string.format([[%s s/ \+$//e]], range))

  -- view復元
  vim.fn.winrestview(view)
end, {
  range = true,
})

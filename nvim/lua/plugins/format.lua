return {
	-- フォーマッタ管理プラグイン (conform.nvim)
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" }, -- ファイル保存前に自動実行
		cmd = { "ConformInfo", "Format" }, -- :Format コマンド実行時にLazyロード
		config = function(_, opts)
			local conform = require("conform")

			-- プラグインの初期化
			conform.setup(opts)

			-- カスタムコマンド :Format の定義
			vim.api.nvim_create_user_command("Format", function(args)
				local range = nil
				if args.count ~= -1 then
					local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
					range = {
						start = { args.line1, 0 },
						["end"] = { args.line2, end_line:len() },
					}
				end
				conform.format({ async = true, lsp_format = "fallback", range = range })
			end, { range = true, desc = "Format buffer or range" })

			-- -- で Format コマンドを実行
			vim.keymap.set("n", "--", "<cmd>Format<cr>")
		end,
		opts = {
			-- 言語ごとのフォーマッタ指定
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				bash = { "shfmt" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
			},
			-- 保存時の自動フォーマット設定
			-- format_on_save = {
			--   timeout_ms = 500,
			--   lsp_format = "fallback",
			-- },
		},
	},
}

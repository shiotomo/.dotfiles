return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- 各言語のパーサー自動インストール
		ts.install({
			"astro",
			"css",
			"dockerfile",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"go",
			"gomod",
			"gosum",
			"gowok",
			"hcl",
			"java",
			"javascript",
			"json",
			"json5",
			"jsonnet",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"mermaid",
			"prisma", -- 必要であればPrismaなどもここに追加できます
			"python",
			"rust",
			"svelte",
			"terraform",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
		})

		vim.api.nvim_create_autocmd({ "FileType", "BufRead", "BufNewFile" }, {
			pattern = "*",
			callback = function(args)
				local lang = vim.bo[args.buf].filetype

				-- 1. 言語名が空、または特定のプラグインのバッファ（noiceやnotifyなど）はスキップ
				if lang == "" or lang == "noice" or lang == "notify" then
					return
				end

				-- 2. 念のため Neovim がその言語のパーサーを認識しているか安全にチェック
				local has_parser = pcall(vim.treesitter.get_string_parser, "", lang)
				if not has_parser then
					return -- パーサーがなければ何もしない（フォールバック）
				end

				-- 3. 安全に Tree-sitter を開始する
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}

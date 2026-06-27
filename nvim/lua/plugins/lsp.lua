return {
  -- 1. LSPサーバーやフォーマッタの自動管理プラグイン
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  -- 1.5 フォーマッタやLinterの自動インストール管理（ここを追加）
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettierd", -- MarkdownやJS、JSONなどを整形する高速フォーマッタ
          "stylua",    -- Lua用フォーマッタ
          "shfmt",     -- Bash用フォーマッタ
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },

  -- 2. mason-lspconfig と 各言語LSPの自動セットアップ
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim", -- 読み込み順の依存関係に追加
      -- ※ もし補完プラグインに blink.cmp を使っている場合はここに残します
      -- "saghen/blink.cmp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- 共通のオンアタッチ関数（キーマップ定義）
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      end

      -- setup の中に ensure_installed と handlers をまとめて記述します
      mason_lspconfig.setup({
        -- 1行ずつ綺麗に整理したLSPのインストールリスト
        ensure_installed = {
          "lua_ls",
          "bashls",
          "clangd",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "gopls",
          "html",
          "jsonls",
          "marksman",
          "ts_ls",
          "kotlin_lsp",
          "java_language_server",
          "rust_analyzer",
        },
        -- ここにハンドラーを定義します
        handlers = {
          -- デフォルトの自動セットアップハンドラ
          function(server_name)
            -- rust_analyzer以外をデフォルト設定で起動
            if server_name ~= "rust_analyzer" then
              lspconfig[server_name].setup({
                on_attach = on_attach,
              })
            end
          end,

          -- Go (gopls) の固有設定
          ["gopls"] = function()
            lspconfig.gopls.setup({
              on_attach = on_attach,
              settings = {
                gopls = {
                  analyses = {
                    unusedparams = true,
                    shadow = true,
                  },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
            })
          end,
        },
      })
    end,
  },

  -- 3. Rust環境用のプラグイン
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            -- 必要であればここにも共通キーマップを適用可能
          end,
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
}

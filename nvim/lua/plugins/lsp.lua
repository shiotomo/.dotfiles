return {
  -- ==========================================
  -- 1. LSP & 組み込み Treesitter 設定
  -- ==========================================
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp'
    },
    config = function()
      -- ----------------------------------------
      -- [追加] vim.treesitter ハイライトの自動有効化
      -- ----------------------------------------
      -- FileType イベント時に、対応する Treesitter パーサーがあれば自動でハイライトを開始します
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("builtin_treesitter_highlight", { clear = true }),
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
          if lang then
            pcall(vim.treesitter.start, args.buf, lang)
          end
        end,
      })

      -- インデントの有効化 (Neovim標準の仕組みを利用)
      vim.cmd("filetype plugin indent on")

      -- ----------------------------------------
      -- 既存の LSP 設定
      -- ----------------------------------------
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      -- local lspconfig = require('lspconfig')
      require('lspconfig')

      local on_attach = function(client, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
      end

      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })
    end
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls', 'bashls', 'clangd', 'cssls', 'dockerls',
          'docker_compose_language_service', 'gopls', 'html', 'jsonls',
          'marksman', 'ts_ls', 'kotlin_lsp', 'java_language_server',
        }
      }
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = "UIEnter",
    config = function()
      require('lspsaga').setup({
        lightbulb = { sign = false },
        use_saga_diagnostic_sign = false,
        error_sign = '', warn_sign = '', hint_sign = '', infor_sign = '',
        dianostic_header_icon = '   ', code_action_icon = ' ',
        code_action_prompt = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
        code_action_keys = { open = 'o', vsplit = 'v', split = 's', quit = 'q', exec = '<CR>', scroll_down = '<C-n>', scroll_up = '<C-p>' },
        code_action_lightbulb = { enable = false },
        border_style = 1, max_preview_lines = 10,
        finder_definition_icon = '  ', finder_reference_icon = '  ',
        finder_action_keys = { open = 'o', vsplit = 'v', split = 's', quit = 'q', scroll_down = '<C-n>', scroll_up = '<C-p>' }
      })
      local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
      local function lsp_server_ready()
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then return false end
        for _, client in ipairs(clients) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] then return true end
        end
        return false
      end
      local function on_cursor_hold()
        if lsp_server_ready() then vim.diagnostic.open_float() end
      end
      local function enable_diagnostics_hover()
        vim.api.nvim_create_augroup(diagnostic_hover_augroup_name, { clear = true })
        vim.api.nvim_create_autocmd({ "CursorHold" }, { group = diagnostic_hover_augroup_name, callback = on_cursor_hold })
      end
      local function disable_diagnostics_hover()
        vim.api.nvim_clear_autocmds({ group = diagnostic_hover_augroup_name })
      end
      vim.api.nvim_set_option('updatetime', 500)
      enable_diagnostics_hover()
      local function on_hover()
        disable_diagnostics_hover()
        vim.lsp.buf.hover()
        vim.api.nvim_create_augroup("lspconfig-enable-diagnostics-hover", { clear = true })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          group = "lspconfig-enable-diagnostics-hover",
          callback = function()
            vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
            enable_diagnostics_hover()
          end
        })
      end

      -- keymaps
      vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
      vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua require("telescope.builtin").lsp_definitions({jump_type = "tab"})<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      vim.keymap.set('n', '<Leader>oh', on_hover)
      vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
      vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
    end
  },
  {
    'nvim-lua/lsp-status.nvim'
  },

  -- ==========================================
  -- 2. Treesitter Context (単体動作)
  -- ==========================================
  {
    'nvim-treesitter/nvim-treesitter-context',
    -- nvim-treesitter への dependencies を完全に削除 
    config = function ()
      require('treesitter-context').setup{
        enable = true,
        multiwindow = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = nil,
        zindex = 20,
        on_attach = nil,
      }
    end
  }
}

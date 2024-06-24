return {
  -- lsp
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
      )
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'bashls',
          'clangd',
          'cmake',
          'cssls',
          'dockerls',
          'docker_compose_language_service',
          'gopls',
          'html',
          'jsonls',
          'tsserver',
          'marksman',
          'pylsp',
          'solargraph',
          'kotlin_language_server',
          -- 'js-debug-adapter',
          -- 'java_language_server',
        }
      }
      require('mason-lspconfig').setup_handlers({ function(server)
        local opt = {
          -- -- Function executed when the LSP server startup
          -- on_attach = function(_, bufnr)
          --   local opts = { noremap=true, silent=true }
          --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
          --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
          -- end,
          -- capabilities = require('cmp_nvim_lsp').update_capabilities(
          --   vim.lsp.protocol.make_client_capabilities()
          -- )
        }
        require('lspconfig')[server].setup(opt)
      end })
    end
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = "UIEnter",
    config = function()
      require('lspsaga').setup({
        lightbulb = {
          sign = false,
        },
        use_saga_diagnostic_sign = false,
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
        dianostic_header_icon = '   ',
        code_action_icon = ' ',
        code_action_prompt = {
          enable = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true
        },
        code_action_keys = {
          open = 'o',
          vsplit = 'v',
          split = 's',
          quit = 'q',
          exec = '<CR>',
          scroll_down = '<C-n>',
          scroll_up = '<C-p>'
        },
        code_action_lightbulb = {
          enable = false,
        },
        border_style = 1,
        max_preview_lines = 10,
        finder_definition_icon = '  ',
        finder_reference_icon = '  ',
        finder_action_keys = {
          open = 'o',
          vsplit = 'v',
          split = 's',
          quit = 'q',
          scroll_down = '<C-n>',
          scroll_up = '<C-p>'
        }
      })
      local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
      local function lsp_server_ready()
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return false
        end
        for _, client in ipairs(clients) do
          if client.attached_buffers[vim.api.nvim_get_current_buf()] then
            return true
          end
        end
        return false
      end
      local function on_cursor_hold()
        if lsp_server_ready() then
          vim.diagnostic.open_float()
        end
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
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" },
        {
          group = "lspconfig-enable-diagnostics-hover",
          callback = function()
            vim.api.nvim_clear_autocmds({ group = "lspconfig-enable-diagnostics-hover" })
            enable_diagnostics_hover()
          end
        })
      end

      -- lsp keymap
      -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
      vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
      -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
      -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
      vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua require("telescope.builtin").lsp_definitions({jump_type = "tab"})<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references({jump_type = "tab"})<CR>',
      --   { noremap = true, silent = true })
      -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
      -- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
      -- vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
      -- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
      -- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
      vim.keymap.set('n', '<Leader>oh', on_hover)

      -- lsp saga keymap
      vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
      vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
      vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
      vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
      -- vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga term_toggle<CR>')
    end
  },
  {
    'nvim-lua/lsp-status.nvim'
  },
}

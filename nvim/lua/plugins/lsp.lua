return {
  {
    'mason-org/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
    },

    config = function()
      vim.cmd('filetype plugin indent on')

      -- diagnostics
      vim.diagnostic.config({
        virtual_text = false,
        underline = true,
        severity_sort = true,
        update_in_insert = false,
      })

      local capabilities =
        require('blink.cmp').get_lsp_capabilities()

      local on_attach = function(_, bufnr)
        vim.bo[bufnr].omnifunc =
          'v:lua.vim.lsp.omnifunc'
      end

      ------------------------------------------------------------------
      -- common servers
      ------------------------------------------------------------------
      local servers = {
        'bashls',
        'clangd',
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'gopls',
        'html',
        'java_language_server',
        'jsonls',
        'kotlin_lsp',
        'marksman',
        'ts_ls',
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })

        vim.lsp.enable(server)
      end

      ------------------------------------------------------------------
      -- lua_ls
      ------------------------------------------------------------------
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        on_attach = on_attach,

        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      })

      vim.lsp.enable('lua_ls')
    end,
  },

  {
    'mason-org/mason-lspconfig.nvim',

    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'bashls',
          'clangd',
          'cssls',
          'docker_compose_language_service',
          'dockerls',
          'gopls',
          'html',
          'java_language_server',
          'jsonls',
          'kotlin_lsp',
          'lua_ls',
          'marksman',
          'ts_ls',
        },
      })
    end,
  },

  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'UIEnter',

    config = function()
      require('lspsaga').setup({
        lightbulb = {
          sign = false,
        },

        use_saga_diagnostic_sign = false,

        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',

        dianostic_header_icon = '  ',
        code_action_icon = ' ',

        code_action_prompt = {
          enable = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },

        code_action_keys = {
          open = 'o',
          vsplit = 'v',
          split = 's',
          quit = 'q',
          exec = '<CR>',
          scroll_down = '<C-n>',
          scroll_up = '<C-p>',
        },

        code_action_lightbulb = {
          enable = false,
        },

        border_style = 1,
        max_preview_lines = 10,

        finder_definition_icon = ' ',
        finder_reference_icon = ' ',

        finder_action_keys = {
          open = 'o',
          vsplit = 'v',
          split = 's',
          quit = 'q',
          scroll_down = '<C-n>',
          scroll_up = '<C-p>',
        },
      })

      ------------------------------------------------------------------
      -- diagnostic hover
      ------------------------------------------------------------------
      local diagnostic_hover_augroup_name =
        'lspconfig-diagnostic'

      local function lsp_server_ready()
        local clients = vim.lsp.get_clients({
          bufnr = vim.api.nvim_get_current_buf(),
        })

        return #clients > 0
      end

      local function on_cursor_hold()
        if lsp_server_ready() then
          vim.diagnostic.open_float(nil, {
            focusable = false,
          })
        end
      end

      local function enable_diagnostics_hover()
        vim.api.nvim_create_augroup(
          diagnostic_hover_augroup_name,
          { clear = true }
        )

        vim.api.nvim_create_autocmd(
          'CursorHold',
          {
            group = diagnostic_hover_augroup_name,
            callback = on_cursor_hold,
          }
        )
      end

      local function disable_diagnostics_hover()
        vim.api.nvim_clear_autocmds({
          group = diagnostic_hover_augroup_name,
        })
      end

      vim.o.updatetime = 500

      enable_diagnostics_hover()

      local function on_hover()
        disable_diagnostics_hover()

        vim.lsp.buf.hover()

        vim.api.nvim_create_augroup(
          'lspconfig-enable-diagnostics-hover',
          { clear = true }
        )

        vim.api.nvim_create_autocmd(
          { 'CursorMoved', 'CursorMovedI' },
          {
            group =
              'lspconfig-enable-diagnostics-hover',

            callback = function()
              vim.api.nvim_clear_autocmds({
                group =
                  'lspconfig-enable-diagnostics-hover',
              })

              enable_diagnostics_hover()
            end,
          }
        )
      end

      ------------------------------------------------------------------
      -- keymaps
      ------------------------------------------------------------------
      vim.keymap.set('n', 'gf', function()
        vim.lsp.buf.format({
          async = true,
        })
      end)

      vim.keymap.set(
        'n',
        'gd',
        require('telescope.builtin').lsp_definitions,
        { silent = true }
      )

      vim.keymap.set(
        'n',
        'gr',
        require('telescope.builtin').lsp_references,
        { silent = true }
      )

      vim.keymap.set(
        'n',
        'gD',
        function()
          require('telescope.builtin').lsp_definitions({
            jump_type = 'tab',
          })
        end,
        { silent = true }
      )

      vim.keymap.set(
        'n',
        'gi',
        vim.lsp.buf.implementation
      )

      vim.keymap.set(
        'n',
        '<Leader>oh',
        on_hover
      )

      vim.keymap.set(
        'n',
        '<Leader>a',
        '<cmd>Lspsaga code_action<CR>',
        { silent = true }
      )

      vim.keymap.set(
        'n',
        'K',
        '<cmd>Lspsaga hover_doc<CR>'
      )

      vim.keymap.set(
        'n',
        'ga',
        '<cmd>Lspsaga code_action<CR>'
      )

      vim.keymap.set(
        'n',
        'gn',
        '<cmd>Lspsaga rename<CR>'
      )
    end,
  },

  {
    'nvim-lua/lsp-status.nvim',
  },
}

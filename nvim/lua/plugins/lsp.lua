-- mason
require('mason').setup()

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

-- lsp
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- lsp saga
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

-- lsp hover
local function on_cursor_hold()
  if vim.lsp.buf.server_ready() then
    vim.diagnostic.open_float()
  end
end
local diagnostic_hover_augroup_name = "lspconfig-diagnostic"
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

-- cmp
local lspkind = require 'lspkind'
local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<TAB>'] = cmp.mapping.select_next_item(),
    ['<C-l>'] = cmp.mapping.complete(),
    -- ['<C-e>']  = cmp.mapping.abort(),
    ['<CR>']  = cmp.mapping.confirm { select = true },
    ['<C-f>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
  options = {
    keyword_length = 1
  },
  -- Lspkind(アイコン)を設定
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    })
  }
}

-- lspkindの設定
lspkind.init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
  type = {
    Array = "",
    Number = "",
    String = "",
    Boolean = "蘒",
    Object = "",
  },
  documents = {
    File = "",
    Files = "",
    Folder = "",
    OpenFolder = "",
  },
  git = {
    Add = "",
    Mod = "",
    Remove = "",
    Ignore = "",
    Rename = "",
    Diff = "",
    Repo = "",
  },
  ui = {
    Lock = "",
    Circle = "",
    BigCircle = "",
    BigUnfilledCircle = "",
    Close = "",
    NewFile = "",
    Search = "",
    Lightbulb = "",
    Project = "",
    Dashboard = "",
    History = "",
    Comment = "",
    Bug = "",
    Code = "",
    Telescope = "",
    Gear = "",
    Package = "",
    List = "",
    SignIn = "",
    Check = "",
    Fire = "",
    Note = "",
    BookMark = "",
    Pencil = "",
    -- ChevronRight = "",
    ChevronRight = ">",
    Table = "",
    Calendar = "",
  },
  diagnostics = {
    Error = "",
    Warning = "",
    Information = "",
    Question = "",
    Hint = "",
  },
  misc = {
    Robot = "ﮧ",
    Squirrel = "",
    Tag = "",
    Watch = "",
  },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- lsp keymap
-- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>',
  { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>',
  { noremap = true, silent = true })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
-- vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
-- vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
-- vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
-- vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', '<Leader>oh', on_hover)

-- lsp saga keymap
vim.api.nvim_set_keymap('n', '<Leader>a', '<cmd>Lspsaga code_action<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
-- vim.keymap.set('n', '<leader>t', '<cmd>Lspsaga term_toggle<CR>')

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        -- shell
        "bash",
        "fish",

        -- setting
        "json",
        "jsonc",
        "toml",
        "yaml",
        "xml",
        "vim",
        "dockerfile",

        -- doc
        "html",
        "markdown",
        "markdown_inline",
        "jsdoc",
        "luadoc",
        "vimdoc",

        -- git
        "gitcommit",
        "git_config",
        "git_rebase",
        "gitignore",
        "gitattributes",

        -- lang
        "c",
        "javascript",
        "lua",
        "luap",
        "python",
        "tsx",
        "typescript",
        "ruby",
        "java",
        "kotlin",
        "go",

        -- other
        "diff",
        "regex",
        "query",
        "graphql",
        "sql",
        "prisma",
      },
    })
  end
}


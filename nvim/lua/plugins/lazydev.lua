return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- Luaファイルを開いたときだけ読み込む
    opts = {
      library = {
        -- plugins = { "nvim-dap-ui" }, -- もし特定のプラグインの型定義も読み込ませたい場合はここに記述
        -- Neovimのランタイムや、lazy.nvim配下のプラグインを自動で型定義の対象にします
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}

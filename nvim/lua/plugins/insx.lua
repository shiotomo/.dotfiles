return {
  'hrsh7th/nvim-insx',
  lazy = true,
  version = '1.1.0',
  event = "InsertEnter",
  config = function()
    require('insx.preset.standard').setup()
  end
}

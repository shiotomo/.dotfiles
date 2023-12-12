return {
  'hrsh7th/nvim-insx',
  lazy = true,
  event = "InsertEnter",
  config = function()
    require('insx.preset.standard').setup()
  end
}

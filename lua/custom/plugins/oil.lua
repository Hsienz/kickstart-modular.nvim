return {
  'https://github.com/stevearc/oil.nvim',
  lazy = false,
  keys = {
    { '<leader>E', '<cmd>Oil --float<CR>', desc = 'Explorer' },
  },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr) return name:match '%.meta$' ~= nil or name:match '%.prefab$' ~= nil or name:match '%.asset$' ~= nil end,
      },
      float = {
        padding = 5,
      },
    }
  end,
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

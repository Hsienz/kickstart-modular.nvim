return {
  'saecki/live-rename.nvim',
  opts = {},
  config = function(_, opts)
    require('live-rename').setup(opts)
    live_rename = require 'live-rename'
    vim.keymap.set('n', '<leader>cr', live_rename.rename, { desc = 'LSP rename' })
  end,
}

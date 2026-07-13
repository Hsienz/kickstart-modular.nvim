return {
  'NStefan002/screenkey.nvim',
  lazy = true,
  init = function()
    vim.keymap.set('n', '<leader>ts', function() require('screenkey').toggle_statusline_component() end, { desc = 'Toggle screenkey statusline component' })
  end,
  config = function()
    require('screenkey').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      win_opts = {
        height = 1,
      },
      clear_after = 30,
      group_mappings = true,
      filter = function(keys)
        local screenkey = require 'screenkey'
        for i, k in ipairs(keys) do
          if screenkey.statusline_component_is_active() and k.key == '%' then keys[i].key = '%%' end
        end
        return keys
      end,
    }
    require('screenkey').toggle_statusline_component()
  end,
}

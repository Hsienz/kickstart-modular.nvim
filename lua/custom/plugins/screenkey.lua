local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'NStefan002/screenkey.nvim' } }

vim.keymap.set('n', '<leader>ts', function() require('screenkey').toggle_statusline_component() end, { desc = 'Toggle screenkey statusline component' })

require('screenkey').setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  win_opts = {
    height = 1,
    width = 20,
  },
  -- clear_after = 30,
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

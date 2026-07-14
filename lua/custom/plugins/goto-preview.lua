local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'rmagatti/goto-preview' }, { src = gh 'rmagatti/logger.nvim' } }

require('goto-preview').setup {}

vim.keymap.set('n', '<leader>pd', function() require('goto-preview').goto_preview_definition() end, { noremap = true, desc = 'goto preview definition' })
vim.keymap.set(
  'n',
  '<leader>pD',
  function() require('goto-preview').goto_preview_declaration() end,
  { noremap = true, desc = 'goto preview declaration' }
)
vim.keymap.set(
  'n',
  '<leader>pi',
  function() require('goto-preview').goto_preview_implementation() end,
  { noremap = true, desc = 'goto preview implementation' }
)
vim.keymap.set(
  'n',
  '<leader>py',
  function() require('goto-preview').goto_preview_type_definition() end,
  { noremap = true, desc = 'goto preview type definition' }
)
vim.keymap.set('n', '<leader>pr', function() require('goto-preview').goto_preview_references() end, { noremap = true, desc = 'goto preview references' })
vim.keymap.set('n', '<leader>P', function() require('goto-preview').close_all_win() end, { noremap = true, desc = 'close all preview windows' })

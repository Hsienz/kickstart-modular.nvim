local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'saecki/live-rename.nvim' } }

require('live-rename').setup {}
local live_rename = require 'live-rename'
vim.keymap.set('n', '<leader>cr', live_rename.rename, { desc = 'LSP rename' })

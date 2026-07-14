local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'danymat/neogen' } }

require('neogen').setup { snippet_engine = 'luasnip' }

vim.keymap.set('n', '<leader>cn', function() require('neogen').generate() end, { desc = 'Generate Annotations (Neogen)' })

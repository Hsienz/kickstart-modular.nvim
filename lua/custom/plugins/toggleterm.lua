local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'akinsho/toggleterm.nvim' } }

require('toggleterm').setup { direction = 'float', open_mapping = [[<c-\>]], shell = 'fish' }

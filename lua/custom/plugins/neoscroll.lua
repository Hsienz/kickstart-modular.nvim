local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'karb94/neoscroll.nvim' } }

require('neoscroll').setup {}

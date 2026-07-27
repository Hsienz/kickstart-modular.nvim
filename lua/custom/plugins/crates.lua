local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'saecki/crates.nvim' } }

require('crates').setup()

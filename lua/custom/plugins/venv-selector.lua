local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'linux-cultist/venv-selector.nvim' } }

require('venv-selector').setup {
  options = {}, -- plugin-wide options
  search = {}, -- custom search definitions
}

vim.keymap.set('n', ',v', '<cmd>VenvSelect<cr>')

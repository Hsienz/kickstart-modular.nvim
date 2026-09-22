local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'nvim-treesitter/nvim-treesitter-context' } }

require('treesitter-context').setup {
  separator = '—',
  max_lines = 3,
}

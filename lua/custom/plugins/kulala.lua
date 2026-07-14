local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'mistweaverco/kulala.nvim' } }

require('kulala').setup {
  global_keymaps = false,
  global_keymaps_prefix = '<leader>R',
  kulala_keymaps_prefix = '',
}

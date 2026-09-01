local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'mistweaverco/kulala.nvim' } }

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'http', 'rest' },
  callback = function()
    require('kulala').setup {
      global_keymaps = true,
      global_keymaps_prefix = '<leader>R',
      kulala_keymaps_prefix = '',
    }
  end,
})

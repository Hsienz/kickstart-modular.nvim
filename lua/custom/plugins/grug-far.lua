local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'MagicDuck/grug-far.nvim' } }

require('grug-far').setup()

vim.keymap.set(
  { 'n', 'x' },
  '<leader>sr',
  function() require('grug-far').open { transient = true, prefills = { search = vim.fn.expand '<cword>' }, visualSelectionUsage = 'auto-detect' } end,
  { desc = 'Search and Replace' }
)

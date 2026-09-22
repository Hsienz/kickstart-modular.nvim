local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'chrisgrieser/nvim-origami' } }

-- recommended: disable vim's auto-folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

require('origami').setup {
  autoFold = {
    enabled = false,
  },
}

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'hiphish/rainbow-delimiters.nvim' },
}

require('rainbow-delimiters.setup').setup {}

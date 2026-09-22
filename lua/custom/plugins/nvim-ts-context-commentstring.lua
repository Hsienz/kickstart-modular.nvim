local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'JoosepAlviste/nvim-ts-context-commentstring' } }

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

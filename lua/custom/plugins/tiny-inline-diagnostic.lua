local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'rachartier/tiny-inline-diagnostic.nvim' } }

require('tiny-inline-diagnostic').setup {
  transparent_bg = true,
}
vim.diagnostic.config { virtual_text = false } -- Only if needed in your configuration, if you already have native LSP diagnostics

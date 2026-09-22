local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'SmiteshP/nvim-navic' } }

require('nvim-navic').setup {
  lsp = {
    auto_attach = true,
  },
  highlight = true,
  lazy_update_context = true,
  depth_limit = 5,
}

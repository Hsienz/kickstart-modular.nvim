return {
  'SmiteshP/nvim-navic',
  lazy = true,
  config = function()
    require('nvim-navic').setup {
      lsp = {
        auto_attach = true,
      },
      highlight = true,
      lazy_update_context = true,
    }
  end,
}

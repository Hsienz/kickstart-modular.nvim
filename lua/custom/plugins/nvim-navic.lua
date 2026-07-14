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
      depth_limit = 5,
    }
  end,
}

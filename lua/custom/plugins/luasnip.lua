return {
  'L3MON4D3/LuaSnip',
  version = '2.*',
  build = (function()
    -- Build Step is needed for regex support in snippets.
    -- This step is not supported in many windows environments.
    -- Remove the below condition to re-enable on windows.
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
    return 'make install_jsregexp'
  end)(),
  dependencies = {
    -- `friendly-snippets` contains a variety of premade snippets.
    --    See the README about individual language/framework/plugin snippets:
    --    https://github.com/rafamadriz/friendly-snippets
    {
      'rafamadriz/friendly-snippets',
      config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
    },
  },
  opts = {},

  config = function(_, opts)
    if opts then require('luasnip').config.setup(opts) end
    vim.tbl_map(function(type) require('luasnip.loaders.from_' .. type).lazy_load() end, { 'vscode', 'snipmate', 'lua' })
    -- friendly-snippets - enable standardized comments snippets
    require('luasnip').filetype_extend('cs', { 'unity' })
  end,
}

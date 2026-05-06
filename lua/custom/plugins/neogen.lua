return {
  'danymat/neogen',
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  opts = { snippet_engine = 'luasnip' },
  keys = {
    {
      '<leader>cn',
      function() require('neogen').generate() end,
      desc = 'Generate Annotations (Neogen)',
    },
  },
}

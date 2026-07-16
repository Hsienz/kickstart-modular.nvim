local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'nvim-neotest/nvim-nio' },
  { src = gh 'antoinemadec/FixCursorHold.nvim' },
  { src = gh 'nvim-neotest/neotest' },
  { src = gh 'nvim-neotest/neotest-python' },
  { src = gh 'nsidorenco/neotest-vstest' },
  { src = gh 'nvim-neotest/neotest' },
  {
    src = gh 'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range '^9',
  },
  { src = gh 'arthur944/neotest-bun' },
}
require('neotest').setup {
  adapters = {
    require 'neotest-python',
    require 'neotest-vstest',
    require 'rustaceanvim.neotest',
    require 'neotest-bun',
  },
}

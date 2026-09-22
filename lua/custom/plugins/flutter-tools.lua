local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'nvim-flutter/flutter-tools.nvim' },
  { src = gh 'nvim-lua/plenary.nvim' },
  -- { src = gh 'stevearc/dressing.nvim' }, -- optional for vim.ui.select
}

require('flutter-tools').setup {}

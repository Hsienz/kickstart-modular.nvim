local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'andrewferrier/debugprint.nvim' },
  { src = gh 'nvim-mini/mini.nvim' }, -- Optional: Needed for line highlighting (full mini.nvim plugin)
  -- ... or ...
  -- { src = gh 'nvim-mini/mini.hipatterns' }, -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)

  -- { src = gh 'ibhagwan/fzf-lua' },              -- Optional: If you want to use the `:Debugprint search` command with fzf-lua
  -- { src = gh 'nvim-telescope/telescope.nvim' }, -- Optional: If you want to use the `:Debugprint search` command with telescope.nvim
  { src = gh 'folke/snacks.nvim' }, -- Optional: If you want to use the `:Debugprint search` command with snacks.nvim
}

require('debugprint').setup {
  keymaps = {
    normal = {
      plain_below = 'g?p',
      plain_above = 'g?P',
      variable_below = 'g?v',
      variable_above = 'g?V',
      variable_below_alwaysprompt = '',
      variable_above_alwaysprompt = '',
      surround_plain = 'g?sp',
      surround_variable = 'g?sv',
      surround_variable_alwaysprompt = '',
      textobj_below = 'g?o',
      textobj_above = 'g?O',
      textobj_surround = 'g?so',
      toggle_comment_debug_prints = 'g?c',
      delete_debug_prints = 'g?d',
    },
    insert = {
      plain = '<C-G>p',
      variable = '<C-G>v',
    },
    visual = {
      variable_below = 'g?v',
      variable_above = 'g?V',
    },
  },
  -- … Other options
}

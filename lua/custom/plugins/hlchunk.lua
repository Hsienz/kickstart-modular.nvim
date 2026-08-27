local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'shellRaining/hlchunk.nvim' } }

require('hlchunk').setup {
  chunk = {
    enable = true,
    style = {
      { fg = '#cba6f7' },
      { fg = '##f38ba8' },
    },
    chars = {
      horizontal_line = '─',
      vertical_line = '│',
      left_top = '╭',
      left_bottom = '╰',
      right_arrow = '─',
    },
  },
  -- indent = { enable = true, chars = { '│' } },
  line_num = {
    enable = true,
    style = {
      { fg = '##cba6f7' },
      { fg = '##f38ba8' },
    },
  },
  exclude_filetypes = {
    'Trouble',
    'alpha',
    'dashboard',
    'help',
    'lazy',
    'mason',
    'neo-tree',
    'notify',
    'snacks_dashboard',
    'snacks_notif',
    'snacks_terminal',
    'snacks_win',
    'toggleterm',
    'trouble',
  },
}

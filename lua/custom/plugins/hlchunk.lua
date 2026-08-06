local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'shellRaining/hlchunk.nvim' } }

require('hlchunk').setup {
  chunk = {
    enable = true,
    -- style = '#00FFFF',
    chars = {
      horizontal_line = '─',
      vertical_line = '│',
      left_top = '┌',
      left_bottom = '└',
      right_arrow = '─',
    },
  },
  -- indent = { enable = true, chars = { '│' } },
  line_num = {
    enable = true,
    -- style = '#00FFFF'
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

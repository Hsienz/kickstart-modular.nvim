return {
  'A7Lavinraj/fyler.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  keys = {
    { '<leader>e', '<Cmd>Fyler kind=split_left_most<Cr>', desc = 'Open Fyler View' },
  },
  opts = {
    integrations = {
      icon = 'nvim_web_devicons',
    },
    views = {
      finder = {
        default_explorer = false,
        columns_order = { 'git', 'diagnostic' },
        columns = {
          git = {
            enabled = true,
            symbols = {
              Untracked = '',
              Added = '',
              Modified = '',
              Deleted = '',
              Renamed = '',
              Copied = '',
              Conflict = '󰕚',
              Ignored = '',
            },
          },
          diagnostic = {
            enabled = true,
            symbols = {
              Error = '󰅜',
              Warn = '󱇎',
              Info = '',
              Hint = '',
            },
          },
          link = {
            enabled = false,
          },
          permission = {
            enabled = false,
          },
          size = {
            enabled = false,
          },
        },
      },
    },
  },
}

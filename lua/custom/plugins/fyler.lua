return {
  'A7Lavinraj/fyler.nvim',
  branch = 'stable',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '<leader>e', '<Cmd>Fyler kind=split_left_most<Cr>', desc = 'Open Fyler View' },
  },
  opts = {
    integrations = {
      icon = 'nvim_web_devicons',
    },
    views = {
      finder = {
        default_explorer = true,
      },
    },
  },
}

return {
  'barrettruth/canola.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons', 'barrettruth/canola-collection' },
  branch = 'canola',
  lazy = false,
  keys = {
    { '<leader>E', '<cmd>Canola --float<CR>', desc = 'Explorer' },
  },
  init = function()
    vim.g.canola_git = {
      format = 'symbol',
    }
    vim.g.canola = {
      hidden = {
        enabled = true,
        patterns = { '%.meta', '%.prefab', '%.asset' },
      },
      float = {
        padding = 5,
      },
      columns = { 'permissions', 'size', 'git_status', 'icon' },
    }
  end,
}

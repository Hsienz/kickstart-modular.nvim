return {
  'barrettruth/canola.nvim',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons', 'barrettruth/canola-collection' },
  branch = 'canola',
  lazy = false,
  keys = {
    { '<leader>fm', '<cmd>Canola --float<CR>', desc = 'Explorer (Canola)' },
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
    vim.api.nvim_create_autocmd('User', {
      pattern = 'CalonaActionsPost',
      callback = function(event)
        if event.data.actions[1].type == 'move' then Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url) end
      end,
    })
  end,
}

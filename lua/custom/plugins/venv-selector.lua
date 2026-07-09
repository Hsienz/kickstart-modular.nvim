return {
  'linux-cultist/venv-selector.nvim',
  ft = 'python', -- Load when opening Python files
  keys = { { ',v', '<cmd>VenvSelect<cr>' } }, -- Open picker on keymap
  opts = {
    options = {}, -- plugin-wide options
    search = {}, -- custom search definitions
  },
}

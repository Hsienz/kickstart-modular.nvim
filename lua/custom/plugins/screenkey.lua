return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*", -- or branch = "main", to use the latest commit
  config = function()
    require("screenkey").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      win_opts = {
        height = 1,
      },
      clear_after = 30,
      group_mappings = true,
    })
  end,
}


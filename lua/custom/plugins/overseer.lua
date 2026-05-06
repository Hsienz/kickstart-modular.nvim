return {
  'stevearc/overseer.nvim',
  lazy = false, -- plugin is self-lazy-loading
  cmd = {
    'OverseerOpen',
    'OverseerClose',
    'OverseerToggle',
    'OverseerRun',
    'OverseerTaskAction',
  },
  opts = {
    dap = false,
    task_list = {
      keymaps = {
        ['<C-j>'] = false,
        ['<C-k>'] = false,
      },
    },
    form = {
      win_opts = {
        winblend = 0,
      },
    },
    task_win = {
      win_opts = {
        winblend = 0,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>ow", "<cmd>OverseerToggle!<cr>",    desc = "Task list" },
    { "<leader>oo", "<cmd>OverseerRun<cr>",        desc = "Run task" },
    { "<leader>ot", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
  },
}

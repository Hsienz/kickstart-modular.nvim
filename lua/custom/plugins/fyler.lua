return {
  'A7Lavinraj/fyler.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  keys = {
    { '<leader>e', '<Cmd>Fyler kind=split_left_most<Cr>', desc = 'Open Fyler View' },
  },
  opts = {
    hooks = {
      on_rename = function(src_path, destination_path) Snacks.rename.on_rename_file(src_path, destination_path) end,
    },
    integrations = {
      icon = 'nvim_web_devicons',
    },
    extensions = {
      git = {
        enabled = true,
        inline = true,
        icons = {
          [' M'] = { icon = '', hl = 'FylerGitModified' },
          ['M '] = { icon = '', hl = 'FylerGitStaged' },
          ['MM'] = { icon = '', hl = 'FylerGitStaged' },
          ['??'] = { icon = '', hl = 'FylerGitUntracked' },
          [' D'] = { icon = '', hl = 'FylerGitDeleted' },
          ['D '] = { icon = '', hl = 'FylerGitStaged' },
          ['R '] = { icon = '', hl = 'FylerGitRenamed' },
          ['UU'] = { icon = '󰦦', hl = 'FylerGitConflict' },
          ['!!'] = { icon = '', hl = 'FylerGitIgnored' },
        },
      },
      -- diagnostic = {
      --   enabled = true,
      --   symbols = {
      --     Error = '󰅜',
      --     Warn = '󱇎',
      --     Info = '',
      --     Hint = '',
      --   },
      -- },
    },
    -- ui = {
    --   indent_guides = true,
    -- },
  },
}

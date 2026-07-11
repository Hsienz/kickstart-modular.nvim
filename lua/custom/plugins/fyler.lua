return {
  'A7Lavinraj/fyler.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  keys = {
    { '<leader>e', '<Cmd>Fyler<Cr>', desc = 'Fyler.nvim - Open' },
  },
  opts = {
    use_as_default_explorer = false,
    hooks = {
      on_rename = function(src_path, destination_path) Snacks.rename.on_rename_file(src_path, destination_path) end,
    },
    integrations = {
      icon = 'nvim_web_devicons',
      window_picker = function() return require('snacks').picker.util.pick_win() end,
    },

    kind = 'split_left_most',
    kind_presets = {
      split_left_most = {
        mappings = { n = { ['<CR>'] = { action = 'select', args = { close = true, pick = false } } } },
      },
    },
    extensions = {
      git = {
        enabled = true,
        inline = false,
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
    ui = {
      hidden_items = {
        patterns = { '%.asset$', '%.prefab$', '%.meta$' },
      },
      indent_guides = true,
    },
  },
}

local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { { src = gh 'A7Lavinraj/fyler.nvim', version = 'e87911e6c21d099225063f5aa672e00f6dbb5976' }, { src = gh 'nvim-tree/nvim-web-devicons' } }
vim.keymap.set('n', '<leader>e', '<Cmd>Fyler kind=split_left_most<Cr>', { desc = 'Open Fyler View' })
require('fyler').setup {
  hooks = {
    on_rename = function(src_path, destination_path) Snacks.rename.on_rename_file(src_path, destination_path) end,
  },
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
            Copied = '󱐪',
            Conflict = '󰦦',
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
}

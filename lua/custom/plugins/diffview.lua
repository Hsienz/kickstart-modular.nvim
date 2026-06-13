-- Lazy
return {
  'dlyongemallo/diffview-plus.nvim',
  version = '*',
  -- optional: lazy-load on command
  cmd = {
    'DiffviewOpen',
    'DiffviewToggle',
    'DiffviewFileHistory',
    'DiffviewDiffFiles',
    'DiffviewLog',
    'DiffviewMergeFiles',
  },
  init = function()
    -- Toggle diffview open/close
    vim.keymap.set('n', '<leader>gvv', '<cmd>DiffviewToggle<cr>', { desc = 'Toggle Diffview' })

    -- Diff working directory
    vim.keymap.set('n', '<leader>gvo', '<cmd>DiffviewOpen<cr>', { desc = 'Diffview open' })
    vim.keymap.set('n', '<leader>gvc', '<cmd>DiffviewClose<cr>', { desc = 'Diffview close' })

    -- File history
    vim.keymap.set('n', '<leader>gvh', '<cmd>DiffviewFileHistory %<cr>', { desc = 'File history (current file)' })
    vim.keymap.set('n', '<leader>gvH', '<cmd>DiffviewFileHistory<cr>', { desc = 'File history (repo)' })

    -- Visual mode: history for selection
    vim.keymap.set('v', '<leader>gvh', "<Esc><cmd>'<,'>DiffviewFileHistory --follow<CR>", { desc = 'Range history' })

    -- Single line history
    vim.keymap.set('n', '<leader>gvl', '<cmd>.DiffviewFileHistory --follow<CR>', { desc = 'Line history' })

    -- Diff against main/master branch (useful before merging)
    vim.keymap.set('n', '<leader>gvm', function()
      -- Try main first, fall back to master
      local result = vim.fn.systemlist { 'git', 'rev-parse', '--verify', 'main' }
      local ok = vim.v.shell_error == 0 and result[1] ~= nil and result[1] ~= ''
      local branch = ok and 'main' or 'master'
      vim.cmd('DiffviewOpen ' .. branch)
    end, { desc = 'Diff against main/master' })
  end,
  config = function()
    require('diffview').setup {
      enhanced_diff_hl = true,
      use_icons = true,
      diffopt = { algorithm = 'histogram' },
      preferred_adapter = 'jj',
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff4_mixed' },
        cycle_layouts = {
          merge_tool = { 'diff4_mixed', 'diff3_mixed', 'diff3_horizontal', 'diff1_plain' },
        },
      },
      file_panel = {
        listing_style = 'tree',
        win_config = { position = 'left', width = 35 }, -- Use "auto" to fit content
      },
      hooks = {}, -- See :h diffview-config-hooks
      keymaps = {}, -- See :h diffview-config-keymaps
    }
  end,
}

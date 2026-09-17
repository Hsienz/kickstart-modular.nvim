local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'A7Lavinraj/fyler.nvim' }, { src = gh 'nvim-tree/nvim-web-devicons' } }
require('fyler').setup {
  use_as_default_explorer = false,
  hooks = {
    on_rename = function(src_path, destination_path)
      Snacks.rename.on_rename_file(src_path, destination_path, function()
        local buf = vim.fn.bufnr(src_path)
        if buf < 0 then return end

        local clients = vim.lsp.get_clients { bufnr = buf }
        for _, client in ipairs(clients) do
          vim.lsp.buf_detach_client(buf, client.id)
        end

        vim.api.nvim_buf_call(buf, function() vim.cmd 'doautocmd BufFilePre' end)
        vim.api.nvim_buf_set_name(buf, destination_path)
        vim.api.nvim_buf_call(buf, function() vim.cmd 'doautocmd BufFilePost' end)
        vim.bo[buf].buflisted = true

        vim.schedule(function()
          for _, client in ipairs(clients) do
            vim.lsp.buf_attach_client(buf, client.id)
          end
        end)
      end)
    end,

    on_delete = function(path)
      local bufnr = vim.fn.bufnr(path)
      if bufnr ~= -1 then vim.api.nvim_buf_delete(bufnr, { force = true }) end
    end,
  },
  integrations = {
    icon = 'nvim_web_devicons',
    window_picker = function() return require('snacks').picker.util.pick_win() end,
  },

  kind = 'split_left_most',
  kind_presets = {
    split_left_most = {
      mappings = { n = { ['<CR>'] = { action = 'select', args = { close = true, pick = true } } } },
    },
  },
  extensions = {
    git = {
      enabled = true,
      inline = false,
      icons = {
        [' M'] = { icon = ' ', hl = 'FylerGitModified' },
        ['M '] = { icon = ' ', hl = 'FylerGitStaged' },
        ['MM'] = { icon = ' ', hl = 'FylerGitStaged' },
        ['??'] = { icon = ' ', hl = 'FylerGitUntracked' },
        [' D'] = { icon = ' ', hl = 'FylerGitDeleted' },
        ['D '] = { icon = ' ', hl = 'FylerGitStaged' },
        ['R '] = { icon = ' ', hl = 'FylerGitRenamed' },
        ['UU'] = { icon = '󰦦 ', hl = 'FylerGitConflict' },
        ['!!'] = { icon = ' ', hl = 'FylerGitIgnored' },
      },
    },
    trash = {
      enabled = true,
    },
    watcher = {
      enabled = true,
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
}

vim.keymap.set('n', '<leader>e', '<Cmd>Fyler<Cr>', { desc = 'Fyler.nvim - Open' })

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  {
    src = gh 'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range '^9',
  },
}

vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set('n', '<leader>ca', function()
        vim.cmd.RustLsp 'codeAction' -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end, { silent = true, buffer = bufnr, desc = 'Code Action (rustaceanvim)' })
      vim.keymap.set(
        'n',
        'K', -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
        function() vim.cmd.RustLsp { 'hover', 'actions' } end,
        { silent = true, buffer = bufnr, desc = 'Hover (rustaceanvim)' }
      )
    end,
  },
}

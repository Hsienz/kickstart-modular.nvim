local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'GustavEikaas/easy-dotnet.nvim' }, { src = 'nvim-lua/plenary.nvim' }, { src = 'folke/snacks.nvim' } }

require('easy-dotnet').setup {
  lsp = {
    easy_dotnet_extension_enabled = true,
    enhanced_rename = true,
    razor = {
      enabled = false,
    },
  },
}

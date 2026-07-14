local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'MeanderingProgrammer/render-markdown.nvim' },
  -- { src = gh 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- { src = gh 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  { src = gh 'nvim-treesitter/nvim-treesitter' },
  { src = gh 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
}

---@module 'render-markdown'
---@type render.md.UserConfig
require('render-markdown').setup {
  completions = { blink = { enabled = true }, lsp = { enabled = true } },
}

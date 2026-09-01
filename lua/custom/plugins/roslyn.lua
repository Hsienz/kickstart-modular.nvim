local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'seblyng/roslyn.nvim' } }

---@module 'roslyn.config'
---@type RoslynNvimConfig
require('roslyn').setup {
  filewatching = 'roslyn',
}

local util = require 'lspconfig.util'
---
---@type vim.lsp.Config
return {
  cmd = { 'node', vim.fn.stdpath 'config' .. '/lsp/yarn-spinner/extension/out/language-server/server.js', '--stdio' },
  root_dir = util.root_pattern '*.yarnproject'() or vim.fn.getcwd(),
  filetypes = { 'yarn' },
}

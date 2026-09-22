local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'nvim-treesitter/nvim-treesitter-textobjects', version = 'main' } }

-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true

-- Or, disable per filetype (add as you like)
-- vim.g.no_python_maps = true
-- vim.g.no_ruby_maps = true
-- vim.g.no_rust_maps = true
-- vim.g.no_go_maps = true

require('nvim-treesitter-textobjects').setup {
  move = {
    -- whether to set jumps in the jumplist
    set_jumps = true,
  },
}

vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects') end)

vim.keymap.set({ 'n', 'x', 'o' }, ']F', function() require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects') end)

vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects') end)

vim.keymap.set({ 'n', 'x', 'o' }, '[F', function() require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects') end)
vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects') end)

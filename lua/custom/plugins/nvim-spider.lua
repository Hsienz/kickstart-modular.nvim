local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'chrisgrieser/nvim-spider' } }

vim.keymap.set({ 'n', 'o', 'x' }, 'w', function() require('spider').motion 'w' end)
vim.keymap.set({ 'n', 'o', 'x' }, 'e', function() require('spider').motion 'e' end)
vim.keymap.set({ 'n', 'o', 'x' }, 'b', function() require('spider').motion 'b' end)

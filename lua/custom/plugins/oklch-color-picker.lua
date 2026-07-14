local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'eero-lehtinen/oklch-color-picker.nvim' } }

---@type oklch.Opts
require('oklch-color-picker').setup {}

-- One handed keymap recommended, you will be using the mouse
vim.keymap.set('n', '<leader>v', function() require('oklch-color-picker').pick_under_cursor() end, { desc = 'Color pick under cursor' })

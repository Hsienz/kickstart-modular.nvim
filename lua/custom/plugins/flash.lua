local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'folke/flash.nvim' } }

-- Mirrors lazy.nvim's `event = "BufReadPre"`: only wire flash up once an
-- actual file buffer is opened, so it never activates over the dashboard.
vim.api.nvim_create_autocmd('BufReadPre', {
  once = true,
  callback = function()
    ---@type Flash.Config
    require('flash').setup {}

    vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end, { desc = 'Flash' })
    vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
    vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
    vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
    vim.keymap.set('c', '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })
  end,
})

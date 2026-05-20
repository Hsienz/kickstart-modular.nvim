return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'lewis6991/async.nvim',
  },
  lazy = false,
  config = function()
    local keymap = vim.keymap

    keymap.set({ 'n', 'x' }, '<leader>re', function() return require('refactoring').extract_func() end, { desc = 'Extract Function', expr = true })
    -- `_` is the default textobject for "current line"
    keymap.set('n', '<leader>ree', function() return require('refactoring').extract_func() .. '_' end, { desc = 'Extract Function (line)', expr = true })

    keymap.set(
      { 'n', 'x' },
      '<leader>rE',
      function() return require('refactoring').extract_func_to_file() end,
      { desc = 'Extract Function To File', expr = true }
    )

    keymap.set({ 'n', 'x' }, '<leader>rv', function() return require('refactoring').extract_var() end, { desc = 'Extract Variable', expr = true })

    -- `_` is the default textobject for "current line"
    keymap.set('n', '<leader>rvv', function() return require('refactoring').extract_var() .. '_' end, { desc = 'Extract Variable (line)', expr = true })

    keymap.set({ 'n', 'x' }, '<leader>ri', function() return require('refactoring').inline_var() end, { desc = 'Inline Variable', expr = true })
    keymap.set({ 'n', 'x' }, '<leader>rI', function() return require('refactoring').inline_func() end, { desc = 'Inline function', expr = true })

    keymap.set({ 'n', 'x' }, '<leader>rs', function() return require('refactoring').select_refactor() end, { desc = 'Select refactor' })
  end,
}

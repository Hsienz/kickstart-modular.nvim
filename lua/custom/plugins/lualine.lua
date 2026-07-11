return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      -- other options ...
      sections = {
        -- other sections ...
        lualine_b = { 'branch', { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } }, 'diagnostics' },
        lualine_c = {
          'filename',
          { 'navic', color_correction = 'static' },
        },
        lualine_x = {
          function() return require('screenkey').get_keys() end,
          'encoding',
          'fileformat',
          'filetype',
        },
      },
    }
  end,
}

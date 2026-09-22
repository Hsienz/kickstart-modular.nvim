local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'nvim-lualine/lualine.nvim' }, { src = gh 'nvim-tree/nvim-web-devicons' }, { src = gh 'SmiteshP/nvim-navic' } }

require('lualine').setup {
  -- other options ...
  options = {
    globalstatus = true,
  },
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

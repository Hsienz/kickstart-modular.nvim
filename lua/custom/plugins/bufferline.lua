local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'akinsho/bufferline.nvim' }, { src = gh 'nvim-tree/nvim-web-devicons' } }
require('bufferline').setup {
  options = {
    indicator = {
      style = 'underline',
    },
    show_buffer_close_icons = false,
    separator_style = 'thin',
  },
}

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'Aasim-A/scrollEOF.nvim' } }

require('scrollEOF').setup {
  insert_mode = true,
  disabled_filetypes = {
    'terminal',
    'snacks_terminal', -- Fix flickering in LazyGit and terminals
  },
}

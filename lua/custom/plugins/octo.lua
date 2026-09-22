local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'pwntester/octo.nvim' },
  { src = gh 'nvim-lua/plenary.nvim' },
  { src = gh 'nvim-tree/nvim-web-devicons' },
}

require('octo').setup {
  enable_builtin = true,
  default_to_projects_v2 = true,
  default_merge_method = 'squash',
  picker = 'snacks',
  ssh_aliases = { ['github-private'] = 'github.com' },
  suppress_missing_scope = {
    projects_v2 = true,
  },
}

vim.keymap.set('n', '<leader>gi', '<cmd>Octo issue list<CR>', { desc = 'List Issues (Octo)' })
vim.keymap.set('n', '<leader>gI', '<cmd>Octo issue search<CR>', { desc = 'Search Issues (Octo)' })
vim.keymap.set('n', '<leader>gp', '<cmd>Octo pr list<CR>', { desc = 'List PRs (Octo)' })
vim.keymap.set('n', '<leader>gP', '<cmd>Octo pr search<CR>', { desc = 'Search PRs (Octo)' })
vim.keymap.set('n', '<leader>gr', '<cmd>Octo repo list<CR>', { desc = 'List Repos (Octo)' })
vim.keymap.set('n', '<leader>gS', '<cmd>Octo search<CR>', { desc = 'Search (Octo)' })

local ok_wk, which_key = pcall(require, 'which-key')
if ok_wk then
  which_key.add {
    { '<localleader>a', group = '+assignee (Octo)' },
    { '<localleader>c', group = '+comment/code (Octo)' },
    { '<localleader>l', group = '+label (Octo)' },
    { '<localleader>i', group = '+issue (Octo)' },
    { '<localleader>r', group = '+react (Octo)' },
    { '<localleader>p', group = '+pr (Octo)' },
    { '<localleader>pr', group = '+rebase (Octo)' },
    { '<localleader>ps', group = '+squash (Octo)' },
    { '<localleader>v', group = '+review (Octo)' },
    { '<localleader>g', group = '+goto_issue (Octo)' },
  }
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'octo',
  callback = function(event)
    vim.keymap.set('i', '@', '@<C-x><C-o>', { buffer = event.buf, silent = true })
    vim.keymap.set('i', '#', '#<C-x><C-o>', { buffer = event.buf, silent = true })
  end,
})

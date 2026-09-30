local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh '3rd/diagram.nvim' },
  { src = gh '3rd/image.nvim' },
}

require('image').setup {}
require('diagram').setup {
  -- Disable automatic rendering for manual-only workflow
  events = {
    render_buffer = {}, -- Empty = no automatic rendering
    clear_buffer = { 'BufLeave' },
  },
  renderer_options = {
    mermaid = {
      theme = 'forest',
      scale = 2,
    },
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'norg' },
  callback = function()
    vim.keymap.set('n', 'K', function() require('diagram').show_diagram_hover() end, { desc = 'Show diagram in new tab' })
  end,
})

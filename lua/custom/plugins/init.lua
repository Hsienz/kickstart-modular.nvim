local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'catppuccin/nvim', name = 'catppuccin' },
  { src = gh 'everviolet/nvim', name = 'evergarden' },
  { src = gh 'ray-x/aurora' },
  { src = gh 'sainnhe/everforest' },
}

require('catppuccin').setup {
  flavour = 'mocha',
  transparent_background = true,
  auto_integrations = true,
  float = {
    transparent = true,
    solid = false,
  },
}

vim.g.aurora_italic = 1
vim.g.aurora_transparent = 1
vim.g.aurora_bold = 1
-- vim.cmd.colorscheme 'aurora'

vim.g.everforest_enable_italic = true
vim.g.everforest_background = 'hard'
vim.g.everforest_transparent_background = 2
vim.g.everforest_float_style = 'blend'
vim.g.everforest_pmenu_style = 'blend'
-- vim.cmd.colorscheme 'everforest'

require('evergarden').setup {
  theme = {
    variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
    accent = 'green',
  },
  editor = {
    transparent_background = true,
    sign = { color = 'none' },
    float = {
      color = 'none',
      solid_border = false,
    },
    completion = {
      color = 'none',
    },
  },
}
vim.cmd.colorscheme 'evergarden'
-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

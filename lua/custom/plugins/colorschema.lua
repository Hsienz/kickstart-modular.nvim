return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = 'transparent',
  --       floats = 'transparent',
  --     },
  --   },
  -- },
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = true,
      auto_integrations = true,
      float = {
        transparent = true,
        solid = false,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme 'evergarden'
    end,
  },
  {
    'everviolet/nvim',
    name = 'evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = 'winter', -- 'winter'|'fall'|'spring'|'summer'
        accent = 'green',
      },
      editor = {
        transparent_background = true,
        -- sign = { color = 'surface0' },
        float = {
          -- color = 'mentle',
          -- solid_border = true,
        },
        completion = {
          -- color = 'mentle',
        },
      },
    },
    config = function(_, opts)
      require('evergarden').setup(opts)
      -- vim.cmd.colorscheme 'evergarden'
    end,
  },
  {
    'ricardoraposo/bonsai.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'danfry1/lume',
    lazy = false,
    priority = 1000,
    config = function() require('lume').setup() end,
  },
  {
    'ray-x/aurora',
    init = function()
      vim.g.aurora_italic = 1
      vim.g.aurora_transparent = 1
      vim.g.aurora_bold = 1
    end,
    -- config = function() vim.cmd.colorscheme 'aurora' end,
  },
  {
    'wnkz/monoglow.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      require('monoglow').setup(opts)
      -- vim.cmd.colorscheme 'monoglow'
    end,
  },
}

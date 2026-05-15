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
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      -- vim.g.everforest_background = "soft"
      -- vim.g.everforest_enable_italic = true
      -- vim.g.everforest_transparent_background = 2
      -- vim.g.everforest_float_style = "blend"
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
    'jpwol/thorn.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
    config = function(_, opts)
      require('thorn').setup(opts)
      vim.cmd.colorscheme 'thorn'
    end,
  },
}

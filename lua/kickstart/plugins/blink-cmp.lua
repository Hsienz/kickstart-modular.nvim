local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'onsails/lspkind.nvim' } }
-- [[ Snippet Engine ]]

-- NOTE: You can also specify plugin using a version range for its git tag.
--  See `:help vim.version.range()` for more info
vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- `friendly-snippets` contains a variety of premade snippets.
--    See the README about individual language/framework/plugin snippets:
--    https://github.com/rafamadriz/friendly-snippets
--
vim.pack.add { gh 'rafamadriz/friendly-snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

vim.tbl_map(function(type) require('luasnip.loaders.from_' .. type).lazy_load() end, { 'vscode', 'snipmate', 'lua' })
-- friendly-snippets - enable standardized comments snippets
if vim.fn.glob 'unity.*.csproj' ~= '' then require('luasnip').filetype_extend('cs', { 'unity' }) end
if vim.fn.glob '*.uproject' ~= '' then require('luasnip').filetype_extend('cpp', { 'unreal' }) end

-- [[ Autocomplete Engine ]]
vim.pack.add { { src = gh 'saghen/blink.lib' }, { src = gh 'saghen/blink.cmp' }, { src = gh 'taku25/blink-cmp-unreal' } }
local cmp = require 'blink.cmp'
cmp.build():pwait()
cmp.setup {
  keymap = {
    -- 'default' (recommended) for mappings similar to built-in completions
    --   <c-y> to accept ([y]es) the completion.
    --    This will auto-import if your LSP supports it.
    --    This will expand snippets if the LSP sent a snippet.
    -- 'super-tab' for tab to accept
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- For an understanding of why the 'default' preset is recommended,
    -- you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    --
    -- All presets have the following mappings:
    -- <tab>/<s-tab>: move to right/left of your snippet expansion
    -- <c-space>: Open menu or open docs if already open
    -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
    -- <c-e>: Hide menu
    -- <c-k>: Toggle signature help
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    preset = 'enter',
    ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },

    -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
    --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  completion = {
    -- By default, you may press `<c-space>` to show the documentation.
    -- Optionally, set `auto_show = true` to show the documentation after a delay.
    -- documentation = { auto_show = false, auto_show_delay_ms = 500 },

    list = {
      selection = {
        preselect = true,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = 'rounded',
      },
    },
    ghost_text = {
      enabled = true,
    },
    accept = {
      -- experimental auto-brackets support
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      border = 'rounded',
      auto_show_delay_ms = 0,
      draw = {
        treesitter = { 'lsp' },
        columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
        components = {
          kind_icon = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                if dev_icon then icon = dev_icon end
              else
                icon = require('lspkind').symbol_map[ctx.kind] or ''
              end

              return icon .. ctx.icon_gap
            end,

            -- Optionally, use the highlight groups from nvim-web-devicons
            -- You can also add the same function for `kind.highlight` if you want to
            -- keep the highlight groups in sync with the icons.
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                if dev_icon then hl = dev_hl end
              end
              return hl
            end,
          },
        },
      },
    },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'unreal' },
    providers = {
      unreal = {
        module = 'blink-cmp-unreal',
        name = 'unreal',
        score_offset = 15,
      },
    },
  },

  snippets = { preset = 'luasnip' },

  -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
  -- which automatically downloads a prebuilt binary when enabled.
  --
  -- By default, we use the Lua implementation instead, but you may enable
  -- the rust implementation via `'prefer_rust_with_warning'`
  --
  -- See :h blink-cmp-config-fuzzy for more information
  fuzzy = { implementation = 'rust' },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true, window = {
    border = 'rounded',
  } },

  cmdline = {
    enabled = true,
    keymap = { preset = 'inherit' },
    completion = {
      menu = { auto_show = true },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
  },
}

return {
  'saghen/blink.cmp',
  build = function()
    -- build the fuzzy matcher, wait up to 60 seconds
    -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
    require('blink.cmp').build():wait(60000)
  end,
  dependencies = { 'saghen/blink.lib', 'onsails/lspkind.nvim', 'nvim-tree/nvim-web-devicons' },
  opts = {
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
    },
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
    },
    signature = { enabled = true, window = {
      border = 'rounded',
    } },
    completion = {
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
    snippets = {
      preset = 'luasnip',
    },
    sources = {
      default = { 'snippets', 'lsp', 'path', 'buffer' },
    },
    fuzzy = { implementation = 'rust' },
    cmdline = {
      enabled = true,
      keymap = { preset = 'inherit' },
      completion = { menu = { auto_show = true }, list = {
        selection = {
          preselect = false,
        },
      } },
    },
  },
}

local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'nvim-neotest/nvim-nio' },
  { src = gh 'antoinemadec/FixCursorHold.nvim' },
  { src = gh 'nvim-neotest/neotest' },
  { src = gh 'nvim-neotest/neotest-python' },
  { src = gh 'nsidorenco/neotest-vstest' },
  { src = gh 'nvim-neotest/neotest' },
  {
    src = gh 'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range '^9',
  },
  { src = gh 'arthur944/neotest-bun' },
  { src = gh 'marilari88/neotest-vitest' },
}

require('neotest').setup {
  adapters = {
    -- Must stay first: rustaceanvim's root() does an unguarded vim.env.HOME
    -- call with no fast-event protection. If another adapter's root() runs
    -- an async op first and leaves the coroutine resumed from a raw libuv
    -- callback, rustaceanvim's call inherits that context and throws E5560.
    require 'rustaceanvim.neotest',
    require 'neotest-python',
    require 'neotest-vstest',
    require 'neotest-bun',
    require 'neotest-vitest',
  },
}

vim.keymap.set('n', '<leader>ta', function() require('neotest').run.attach() end, { desc = 'Attach to Test (Neotest)' })

vim.keymap.set('n', '<leader>tt', function() require('neotest').run.run(vim.fn.expand '%') end, { desc = 'Run File (Neotest)' })

vim.keymap.set('n', '<leader>tT', function() require('neotest').run.run(vim.uv.cwd()) end, { desc = 'Run All Test Files (Neotest)' })

vim.keymap.set('n', '<leader>tr', function() require('neotest').run.run() end, { desc = 'Run Nearest (Neotest)' })

vim.keymap.set('n', '<leader>tl', function() require('neotest').run.run_last() end, { desc = 'Run Last (Neotest)' })

vim.keymap.set('n', '<leader>ts', function() require('neotest').summary.toggle() end, { desc = 'Toggle Summary (Neotest)' })

vim.keymap.set(
  'n',
  '<leader>to',
  function()
    require('neotest').output.open {
      enter = true,
      auto_close = true,
    }
  end,
  { desc = 'Show Output (Neotest)' }
)

vim.keymap.set('n', '<leader>tO', function() require('neotest').output_panel.toggle() end, { desc = 'Toggle Output Panel (Neotest)' })

vim.keymap.set('n', '<leader>tS', function() require('neotest').run.stop() end, { desc = 'Stop (Neotest)' })

vim.keymap.set('n', '<leader>tw', function() require('neotest').watch.toggle(vim.fn.expand '%') end, { desc = 'Toggle Watch (Neotest)' })

vim.keymap.set('n', '<leader>td', function()
  require('neotest').run.run {
    strategy = 'dap',
  }
end, { desc = 'Debug Nearest' })

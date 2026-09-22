-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/jay-babu/mason-nvim-dap.nvim',
  'https://github.com/leoluz/nvim-dap-go',
  "https://github.com/mfussenegger/nvim-dap-python",
	'https://github.com/ownself/nvim-dap-unity'
}

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function(args)
        require("dap-python").setup("uv")

        local opts = { buffer = args.buf }

        vim.keymap.set("n", "<leader>dPt", function()
            require("dap-python").test_method()
        end, vim.tbl_extend("force", opts, { desc = "Debug: Method" }))

        vim.keymap.set("n", "<leader>dPc", function()
            require("dap-python").test_class()
        end, vim.tbl_extend("force", opts, { desc = "Debug: Class" }))
    end,
})

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>dO', function() require('dap').step_over() end, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>do', function() require('dap').step_out() end, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', function() require('persistent-breakpoints.api').toggle_breakpoint() end, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dB', function() require('persistent-breakpoints.api').set_conditional_breakpoint() end, { desc = 'Debug: Set Breakpoint' })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<leader>d<tab>', function() require('dapui').toggle() end, { desc = 'Debug: See last session result.' })
-- From LazyVim
vim.keymap.set('n', '<leader>dC', function() require('dap').run_to_cursor() end, { desc = 'Debug: Run to Cursor' })
vim.keymap.set('n', '<leader>dj', function() require('dap').down() end, { desc = 'Debug: Run Down' })
vim.keymap.set('n', '<leader>dk', function() require('dap').up() end, { desc = 'Debug: Run Up' })
vim.keymap.set('n', '<leader>dg', function() require('dap').goto() end, { desc = 'Debug: Go to Line(No Execute)' })
vim.keymap.set('n', '<leader>dl', function() require('dap').run_last() end, { desc = 'Debug: Run Last' })
vim.keymap.set('n', '<leader>dP', function() require('dap').pause() end, { desc = 'Debug: Pause' })
vim.keymap.set('n', '<leader>dr', function() require('dap').repl.toggle() end, { desc = 'Debug: Toggle REPL' })
vim.keymap.set('n', '<leader>ds', function() require('dap').session() end, { desc = 'Debug: Session' })
vim.keymap.set('n', '<leader>dt', function() require('dap').terminate() end, { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<leader>dw', function() require('dap.ui.widgets').hover() end, { desc = 'Debug: Widgets' })
vim.keymap.set('n', '<leader>dX', function() require('persistent-breakpoints.api').clear_all_breakpoints() end, { desc = 'Debug: Clear All Breakpoints' })
vim.keymap.set('n', '<leader>dL', function() require('persistent-breakpoints.api').set_log_point() end, { desc = 'Debug: Set Log Point' })

local dap = require 'dap'
local dapui = require 'dapui'
-- local dapui = require 'dap-view'

require('mason-nvim-dap').setup {
  -- Makes a best effort to setup the various debuggers with
  -- reasonable debug configurations
  automatic_installation = true,

  -- You can provide additional configuration to the handlers,
  -- see mason-nvim-dap README for more information
  handlers = {},

  -- You'll need to check that you have the required things installed
  -- online, please don't ask me how to install them :)
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the langs you want
    'delve',
  },
}

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
---@diagnostic disable-next-line: missing-fields
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  --    Feel free to remove or use ones that you like more! :)
  --    Don't feel like these are good choices.
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  ---@diagnostic disable-next-line: missing-fields
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
}

-- Change breakpoint icons
vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
local breakpoint_icons = vim.g.have_nerd_font
    and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
  or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
for type, icon in pairs(breakpoint_icons) do
  local tp = 'Dap' .. type
  local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
  vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

-- Install golang specific config
require('dap-go').setup {
  delve = {
    -- On Windows delve must be run attached or it crashes.
    -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    detached = vim.fn.has 'win32' == 0,
  },
}

local dap = require 'dap'
dap.adapters.codelldb = {
  type = 'executable',
  command = 'codelldb', -- or if not in $PATH: "/absolute/path/to/codelldb"

  -- On windows you may have to uncomment this:
  -- detached = false,
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = "netcoredbg",
	args = { "--interpreter=vscode" }
}

dap.configurations.cpp = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.zig = dap.configurations.cpp

dap.configurations.cs = {
	{
		type = "netcoredbg",
		name = "Launch file",
		request = "launch",
		program = function()
		  return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	}
}
dap.configurations.vb = dap.configurations.cs
dap.configurations.fsharp = dap.configurations.cs
require("nvim-dap-unity").setup({
	auto_install_on_start = true
})

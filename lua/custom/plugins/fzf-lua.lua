return {
  'ibhagwan/fzf-lua',
  event = 'VimEnter',
  cmd = 'FzfLua',
  opts = function(_, opts)
    local fzf = require 'fzf-lua'
    local config = fzf.config
    local actions = fzf.actions

    config.defaults.actions.files['ctrl-t'] = require('trouble.sources.fzf').actions.open
    -- Quickfix
    config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
    config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
    config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
    config.defaults.keymap.fzf['ctrl-x'] = 'jump'
    config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
    config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
    config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
    config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'
  end,

  config = function(_, opts)
    require('fzf-lua').setup(opts)
    require('fzf-lua').register_ui_select()
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true })
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(event)
        pcall(vim.keymap.del, 'n', 'grD')
        pcall(vim.keymap.del, 'n', 'gra')
        pcall(vim.keymap.del, 'n', 'gri')
        pcall(vim.keymap.del, 'n', 'grn')
        pcall(vim.keymap.del, 'n', 'grr')
        pcall(vim.keymap.del, 'n', 'grt')
        pcall(vim.keymap.del, 'n', 'grx')
        local buf = event.buf

        -- Find references for the word under your cursor.
        vim.keymap.set('n', 'gr', '<cmd>FzfLua lsp_references<cr>', { buffer = buf, desc = '[G]oto [R]eferences' })

        -- Jump to the implementation of the word under your cursor.
        -- Useful when your language has ways of declaring types without an actual implementation.
        vim.keymap.set('n', 'gI', '<cmd>FzfLua lsp_implementations<cr>', { buffer = buf, desc = '[G]oto [I]mplementation' })

        -- Jump to the definition of the word under your cursor.
        -- This is where a variable was first declared, or where a function is defined, etc.
        -- To jump back, press <C-t>.
        vim.keymap.set('n', 'gd', '<cmd>FzfLua lsp_definitions<cr>', { buffer = buf, desc = '[G]oto [D]efinition' })

        -- Fuzzy find all the symbols in your current document.
        -- Symbols are things like variables, functions, types, etc.
        vim.keymap.set('n', 'gO', '<cmd>FzfLua lsp_document_symbols<cr>', { buffer = buf, desc = 'Open Document Symbols' })

        -- Fuzzy find all the symbols in your current workspace.
        -- Similar to document symbols, except searches over your entire project.
        vim.keymap.set('n', 'gW', '<cmd>FzfLua lsp_live_workspace_symbols<cr>', { buffer = buf, desc = 'Open Workspace Symbols' })

        -- Jump to the type of the word under your cursor.
        -- Useful when you're not sure what type a variable is and you want to see
        -- the definition of its *type*, not where it was *defined*.
        vim.keymap.set('n', 'gy', '<cmd>FzfLua lsp_typedefs<cr>', { buffer = buf, desc = '[G]oto [T]ype Definition' })

        vim.keymap.set('n', 'gD', '<cmd>FzfLua lsp_declarations<cr>', { buffer = buf, desc = '[G]oto [D]eclaration' })
        vim.keymap.set('n', 'ca', '<cmd>FzfLua lsp_code_actions<cr>', { buffer = buf, desc = '[C]ode [A]ction' })
      end,
    })
  end,
  keys = {
    { '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
    { '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
    {
      '<leader>,',
      '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>',
      desc = 'Switch Buffer',
    },
    { '<leader>/', '<cmd>FzfLua live_grep_native<cr>', desc = 'Grep (Root Dir)' },
    { '<leader>:', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    { '<leader><space>', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },
    -- find
    { '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
    { '<leader>fB', '<cmd>FzfLua buffers<cr>', desc = 'Buffers (all)' },
    -- { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files (Root Dir)' },
    { '<leader>fF', '<cmd>FzfLua files cwd<cr>', desc = 'Find Files (cwd)' },
    { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Find Files (git-files)' },
    { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent' },
    { '<leader>fR', '<cmd>FzfLua oldfiles cwd<cr>', desc = 'Recent (cwd)' },
    -- git
    { '<leader>gc', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gd', '<cmd>FzfLua git_diff<cr>', desc = 'Git Diff (files)' },
    { '<leader>gl', '<cmd>FzfLua git_commits<CR>', desc = 'Commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
    { '<leader>gS', '<cmd>FzfLua git_stash<cr>', desc = 'Git Stash' },
    -- search
    { '<leader>s"', '<cmd>FzfLua registers<cr>', desc = 'Registers' },
    { '<leader>s/', '<cmd>FzfLua search_history<cr>', desc = 'Search History' },
    { '<leader>sa', '<cmd>FzfLua autocmds<cr>', desc = 'Auto Commands' },
    { '<leader>sb', '<cmd>FzfLua lines<cr>', desc = 'Buffer Lines' },
    { '<leader>sc', '<cmd>FzfLua command_history<cr>', desc = 'Command History' },
    { '<leader>sC', '<cmd>FzfLua commands<cr>', desc = 'Commands' },
    { '<leader>sd', '<cmd>FzfLua diagnostics_workspace<cr>', desc = 'Diagnostics' },
    { '<leader>sD', '<cmd>FzfLua diagnostics_document<cr>', desc = 'Buffer Diagnostics' },
    { '<leader>sg', '<cmd>FzfLua live_grep_native<cr>', desc = 'Grep (Root Dir)' },
    { '<leader>sG', '<cmd>FzfLua live_grep_native cwd<cr>', desc = 'Grep (cwd)' },
    { '<leader>sh', '<cmd>FzfLua help_tags<cr>', desc = 'Help Pages' },
    { '<leader>sH', '<cmd>FzfLua highlights<cr>', desc = 'Search Highlight Groups' },
    { '<leader>sj', '<cmd>FzfLua jumps<cr>', desc = 'Jumplist' },
    { '<leader>sk', '<cmd>FzfLua keymaps<cr>', desc = 'Key Maps' },
    { '<leader>sl', '<cmd>FzfLua loclist<cr>', desc = 'Location List' },
    { '<leader>sM', '<cmd>FzfLua man_pages<cr>', desc = 'Man Pages' },
    { '<leader>sm', '<cmd>FzfLua marks<cr>', desc = 'Jump to Mark' },
    { '<leader>sR', '<cmd>FzfLua resume<cr>', desc = 'Resume' },
    { '<leader>sq', '<cmd>FzfLua quickfix<cr>', desc = 'Quickfix List' },
    { '<leader>sw', '<cmd>FzfLua grep_cword<cr>', desc = 'Word (Root Dir)' },
    { '<leader>sW', '<cmd>FzfLua grep_cword cwd<cr>', desc = 'Word (cwd)' },
    { '<leader>sw', '<cmd>FzfLua grep_visual<cr>', mode = 'x', desc = 'Selection (Root Dir)' },
    { '<leader>sW', '<cmd>FzfLua grep_visual cwd<cr>', mode = 'x', desc = 'Selection (cwd)' },
    { '<leader>uC', '<cmd>FzfLua colorschemes<cr>', desc = 'Colorscheme with Preview' },
    {
      '<leader>ss',
      function()
        require('fzf-lua').lsp_document_symbols {
          regex_filter = symbols_filter,
        }
      end,
      desc = 'Goto Symbol',
    },
    {
      '<leader>sS',
      function()
        require('fzf-lua').lsp_live_workspace_symbols {
          regex_filter = symbols_filter,
        }
      end,
      desc = 'Goto Symbol (Workspace)',
    },
  },
}

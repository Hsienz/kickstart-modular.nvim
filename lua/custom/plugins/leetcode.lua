local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'kawre/leetcode.nvim' },
  { src = gh 'nvim-lua/plenary.nvim' },
  { src = gh 'MunifTanjim/nui.nvim' },
}
-- NOTE: this plugin normally runs `:TSUpdate html` as a post-install build
-- step; vim.pack.add doesn't run build hooks, so run it manually after install.

require('leetcode').setup {
  -- configuration goes here
  ---@type lc.picker
  picker = { provider = 'snacks-picker' },
  injector = { ---@type table<lc.lang, lc.inject>
    ['python3'] = {
      imports = function(default_imports)
        vim.list_extend(default_imports, { 'from .leetcode import *' })
        return default_imports
      end,
      after = { 'def test():', "    print('test')" },
    },
    ['cpp'] = {
      imports = function()
        -- return a different list to omit default imports
        return { '#include <bits/stdc++.h>', 'using namespace std;' }
      end,
      after = 'int main() {}',
    },
  },
}

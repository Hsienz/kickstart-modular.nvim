local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'khoido2003/roslyn-filewatch.nvim' } }
-- NOTE: this plugin normally runs `nvim -l build.lua --` as a post-install build
-- step; vim.pack.add doesn't run build hooks, so run it manually after install:
--   cd <pack dir>/roslyn-filewatch.nvim && nvim -l build.lua --

require('roslyn_filewatch').setup()

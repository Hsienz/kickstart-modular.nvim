local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  {
    src = gh 'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = vim.version.range '^9',
  },
}

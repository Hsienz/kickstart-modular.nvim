return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  config = function()
    vim.o.scrolloff = 8
    require("scrollEOF").setup({
      insert_mode = true,
      disabled_filetypes = {
        "terminal",
        "snacks_terminal", -- Fix flickering in LazyGit and terminals
      },
    })
  end,
}

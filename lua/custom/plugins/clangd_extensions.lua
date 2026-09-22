local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'dchinmay2/clangd_extensions.nvim' } }

require('clangd_extensions').setup {
  ast = {
    role_icons = {
      type = '',
      declaration = '',
      expression = '',
      specifier = '',
      statement = '',
      ['template argument'] = '',
    },

    kind_icons = {
      Compound = '',
      Recovery = '',
      TranslationUnit = '',
      PackExpansion = '',
      TemplateTypeParm = '',
      TemplateTemplateParm = '',
      TemplateParamObject = '',
    },
  },
}

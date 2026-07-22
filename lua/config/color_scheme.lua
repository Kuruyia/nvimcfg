-- Color scheme
require('catppuccin').setup({
  flavour = 'macchiato',
  show_end_of_buffer = true,
  auto_integrations = true,
  lsp_styles = {
    virtual_text = {
      errors = { 'italic' },
      hints = { 'italic' },
      warnings = { 'italic' },
      information = { 'italic' },
    },
    underlines = {
      errors = { 'underline' },
      hints = { 'underline' },
      warnings = { 'underline' },
      information = { 'underline' },
    },
    inlay_hints = {
      background = true,
    },
  },
  custom_highlights = function(colors)
    return {
      GitSignsChange = { fg = colors.blue },
    }
  end,
})

vim.cmd('colorscheme catppuccin')

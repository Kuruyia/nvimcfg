-- Color scheme
require('catppuccin').setup({
  flavour = 'macchiato',
  show_end_of_buffer = true,
  integrations = {
    gitsigns = true,
    mason = true,
    native_lsp = {
      enabled = true,
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
    cmp = true,
    treesitter = true,
    indent_blankline = {
      enabled = true,
      scope_color = 'lavender',
      colored_indent_levels = false,
    },
    illuminate = {
      enabled = true,
      lsp = true,
    },
    alpha = true,
    neotree = true,
    lsp_trouble = true,
    lsp_saga = true,
    notify = true,
    noice = true,
  },
  custom_highlights = function(colors)
    return {
      GitSignsChange = { fg = colors.blue },
    }
  end,
})

vim.cmd('colorscheme catppuccin')

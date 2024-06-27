-- Color scheme
require('catppuccin').setup({
  flavour = 'macchiato',
  show_end_of_buffer = true,
  integrations = {
    alpha = true,
    cmp = true,
    gitsigns = true,
    illuminate = {
      enabled = true,
      lsp = true,
    },
    indent_blankline = {
      enabled = true,
      scope_color = 'lavender',
      colored_indent_levels = false,
    },
    lsp_saga = true,
    lsp_trouble = true,
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
    neotree = true,
    noice = true,
    notify = true,
    window_picker = true,
    treesitter = true,
  },
  custom_highlights = function(colors)
    return {
      GitSignsChange = { fg = colors.blue },
    }
  end,
})

vim.cmd('colorscheme catppuccin')

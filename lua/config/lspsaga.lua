-- Lspsaga
require('lspsaga').setup({
  ui = {
    border = 'rounded',
    kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
  },
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    virtual_text = false,
  },
})

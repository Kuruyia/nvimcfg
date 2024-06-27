require('window-picker').setup({
  hint = 'floating-big-letter',
  show_prompt = false,
  filter_rules = {
    bo = {
      filetype = { 'FTerm', 'neo-tree', 'neo-tree-popup', 'noice', 'notify', 'TelescopePrompt', 'Trouble' },
      buftype = { 'terminal', 'quickfix' },
    },
  },
})

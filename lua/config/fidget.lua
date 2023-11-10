-- Fidget
require('fidget').setup({
  progress = {
    ignore = { 'ltex' },
    display = {
      group_style = 'FidgetTitle',
    },
  },
  notification = {
    view = {
      group_separator_hl = 'FidgetTask',
    },
    window = {
      normal_hl = 'FidgetTask',
    },
  },
})

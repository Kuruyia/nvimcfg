-- Bufferline
require('bufferline').setup({
  options = {
    separator_style = 'slant',
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'Project',
        highlight = 'Directory',
        separator = true,
      },
    },
    hover = {
      enabled = true,
      delay = 0,
      reveal = { 'close' },
    },
  },
  highlights = require('catppuccin.groups.integrations.bufferline').get(),
})

-- Neo-tree
require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  window = {
    width = 38,
    mappings = {
      ['<cr>'] = 'open_with_window_picker',
    },
  },
})

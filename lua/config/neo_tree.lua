-- Neo-tree
require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  window = {
    width = 38,
  },
})

vim.keymap.set('n', '\\', '<cmd>Neotree reveal<cr>')
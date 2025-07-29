-- Neogit
require('neogit').setup({
  mappings = {
    status = {
      ['j'] = 'MoveUp',
      ['k'] = 'MoveDown',
    },
  },
})

-- Diffview
require('diffview').setup({
  key_bindings = {
    file_history_panel = { q = '<Cmd>DiffviewClose<CR>' },
    file_panel = { q = '<Cmd>DiffviewClose<CR>' },
    view = { q = '<Cmd>DiffviewClose<CR>' },
  },
})

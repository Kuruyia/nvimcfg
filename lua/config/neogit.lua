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
local actions = require('diffview.actions')

require('diffview').setup({
  keymaps = {
    file_history_panel = {
      { 'n', 'j', actions.prev_entry },
      { 'n', 'k', actions.next_entry },
      { 'n', 'q', '<Cmd>DiffviewClose<CR>' },
    },
    file_panel = {
      { 'n', 'j', actions.prev_entry },
      { 'n', 'k', actions.next_entry },
      { 'n', 'q', '<Cmd>DiffviewClose<CR>' },
    },
    view = {
      { 'n', 'q', '<Cmd>DiffviewClose<CR>' },
    },
  },
})

-- Notify
local notify = require('notify')

notify.setup({
  stages = 'slide',
})

-- Use it as the default notification manager
vim.notify = notify

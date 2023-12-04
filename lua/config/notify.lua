-- Notify
local notify = require('notify')

notify.setup({
  stages = 'fade',
  top_down = true,
  timeout = 100,
})

-- Use it as the default notification manager
vim.notify = notify

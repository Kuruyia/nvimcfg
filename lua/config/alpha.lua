-- Alpha
local dashboard = require('alpha.themes.dashboard')

-- Header
local function getGreeting(name)
  local tableTime = os.date('*t')
  local datetime = os.date('  %Y-%m-%d    %H:%M:%S')
  local hour = tableTime.hour
  local greetingIndex = 0
  local greetingsTable = {
    [1] = '  Sleep well',
    [2] = '  Good morning',
    [3] = '  Good afternoon',
    [4] = '  Good evening',
    [5] = '󰖔  Good night',
  }

  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end

  return ' ' .. datetime .. '  ' .. greetingsTable[greetingIndex] .. ', ' .. name
end

dashboard.section.header.val = {
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
  [[]],
  getGreeting('Kuruyia'),
}

dashboard.section.header.opts.position = 'center'
dashboard.section.header.opts.hl = 'AlphaHeader'
dashboard.opts.layout[3].val = 4

-- Buttons
dashboard.section.buttons.val = {
  dashboard.button('s', '   Restore', [[:lua require("persistence").load() <cr>]]),
  dashboard.button('r', '   Recents', ':Telescope oldfiles<CR>'),
  dashboard.button('f', '   Search ', ':Telescope find_files<CR>'),
  dashboard.button('e', '   Create ', ':ene <BAR> startinsert<CR>'),
  dashboard.button('u', '   Update ', ':Lazy sync<CR>'),
  dashboard.button('c', '   Config ', ':e ~/.config/nvim/<CR>'),
  dashboard.button('q', '   Quit   ', ':qa!<CR>'),
}

dashboard.section.buttons.opts.position = 'center'
dashboard.section.buttons.opts.hl = 'AlphaButtons'

-- Footer
vim.api.nvim_create_autocmd('User', {
  once = true,
  pattern = 'LazyVimStarted',
  callback = function()
    local stats = require('lazy').stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    dashboard.section.footer.val = '⚡ Loaded ' .. stats.loaded .. ' plugins in ' .. ms .. 'ms'
    vim.cmd([[AlphaRedraw]])
  end,
})

require('alpha').setup(dashboard.opts)

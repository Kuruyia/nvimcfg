-- FTerm
local fterm = require('FTerm')

fterm.setup({
  border = 'rounded',
})

-- Keymap
local esc_close_fterm = function()
  if vim.bo.filetype ~= 'FTerm' then
    return
  end

  fterm.close()
end

vim.keymap.set('n', '<Esc>', esc_close_fterm)

-- Vim commands
vim.api.nvim_create_user_command('FTermExit', fterm.exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, { bang = true })

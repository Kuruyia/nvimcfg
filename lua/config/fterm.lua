-- FTerm
require('FTerm').setup({
    border = 'rounded'
})

-- Keymap
vim.keymap.set('n', ',', '<CMD>lua require("FTerm").toggle()<CR>')

-- Vim commands
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

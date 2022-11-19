-- Trouble
require('trouble').setup()

-- Vim keymaps
vim.keymap.set('n', 'f', '<CMD>TroubleToggle lsp_references<CR>')
vim.keymap.set('n', 'F', '<CMD>TroubleToggle lsp_definitions<CR>')

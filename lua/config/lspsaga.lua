-- Lspsaga
require('lspsaga').setup({
    ui = {
        border = 'rounded',
    },
    symbol_in_winbar = {
        enable = false,
    },
    lightbulb = {
        virtual_text = false,
    },
})

-- Keymaps
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set({'n','v'}, 'gc', '<cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<CR>')
vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', 'gD', '<cmd>Lspsaga goto_definition<CR>')
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')

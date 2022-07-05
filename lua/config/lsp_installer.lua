-- LSP Installer
require('nvim-lsp-installer').setup({
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        },
        border = 'rounded'
    }
})

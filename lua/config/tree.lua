-- Tree
vim.cmd('packadd nvim-web-devicons')

require('nvim-tree').setup({
    view = {
        width = 38,
        hide_root_folder = true
    },
    renderer = {
        indent_markers = {
            enable = true
        },
        icons = {
            show = {
                folder_arrow = false
            }
        }
    }
})

-- Vim command
vim.api.nvim_create_user_command('Tree', require('nvim-tree.api').tree.toggle, { bang = true })

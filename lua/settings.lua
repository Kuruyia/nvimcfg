-- Options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.titlestring = '%r%m %y %t - Neovim'
vim.opt.ruler = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 2
vim.opt.wrap = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.showmode = false
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100
vim.opt.belloff = 'all'
vim.opt.mouse = 'a'
vim.opt.scrolloff = 8

-- Keymaps
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', 'k', 'gj')
vim.keymap.set('n', 'j', 'gk')
vim.keymap.set('v', 'k', 'gj')
vim.keymap.set('v', 'j', 'gk')

-- Autocmds
local clear_trailing_whitespaces = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[silent! :%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursor_pos)
end

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = clear_trailing_whitespaces
})

-- Neo-tree

vim.api.nvim_create_autocmd('BufLeave', {
  pattern = 'NeogitStatus',
  callback = function()
    -- Update the Neo-tree git status icons when leaving Neogit
    require('neo-tree.events').fire_event('git_event')
  end,
})

require('neo-tree').setup({
  close_if_last_window = true,
  popup_border_style = 'rounded',
  window = {
    width = 38,
    mappings = {
      ['<cr>'] = 'open_with_window_picker',
    },
  },
})

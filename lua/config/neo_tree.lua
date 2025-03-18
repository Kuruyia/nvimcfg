-- Neo-tree

-- Update status on a *Neogit* file update event
-- Stolen from: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/724#issuecomment-2326906398
local is_git_file_event = false
local prev_filetype = ''

vim.api.nvim_create_autocmd('User', {
  pattern = {
    'NeogitCommitComplete',
    'NeogitPullComplete',
    'NeogitBranchCheckout',
    'NeogitBranchReset',
    'NeogitRebase',
    'NeogitReset',
    'NeogitCherryPick',
    'NeogitMerge',
  },
  callback = function()
    is_git_file_event = true
  end,
})

vim.api.nvim_create_autocmd('TabLeave', {
  callback = function()
    prev_filetype = vim.api.nvim_get_option_value('filetype', {})
  end,
})

vim.api.nvim_create_autocmd('TabEnter', {
  callback = function()
    if vim.startswith(prev_filetype, 'Neogit') and is_git_file_event then
      require('neo-tree.events').fire_event('git_event')
      is_git_file_event = false
    end
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

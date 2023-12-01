-- Lualine
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        padding = { left = 1, right = 1 },
        symbols = {
          alternate_file = '',
        },
        filetype_names = {
          TelescopePrompt = 'Telescope',
          dashboard = 'Dashboard',
          packer = 'Packer',
          fzf = 'FZF',
          alpha = 'Alpha',
          NvimTree = 'Tree',
        },
      },
    },
  },

  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        require('nvim-navic').get_location,
        cond = require('nvim-navic').is_available,
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },

  extensions = {},
})

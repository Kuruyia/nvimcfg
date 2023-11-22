-- Color scheme
local material_colors = require('material.colors')
vim.g.material_style = 'palenight'

require('material').setup({
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { --[[ bold = true ]]
    },
    keywords = { --[[ underline = true ]]
    },
    functions = { --[[ bold = true, undercurl = true ]]
    },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
    -- "dap",
    -- "dashboard",
    -- "eyeliner",
    'fidget',
    -- "flash",
    'gitsigns',
    -- "harpoon",
    -- "hop",
    -- "illuminate",
    'indent-blankline',
    'lspsaga',
    -- "mini",
    -- "neogit",
    -- "neorg",
    -- "neotest",
    -- "noice",
    'nvim-cmp',
    'nvim-navic',
    -- 'nvim-tree',
    'nvim-web-devicons',
    -- "rainbow-delimiters",
    -- "sneak",
    'telescope',
    'trouble',
    -- "which-key",
  },

  disable = {
    colored_cursor = true, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false, -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false, -- Enable higher contrast text for darker style
  },

  lualine_style = 'stealth', -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_highlights = {
    LineNr = { fg = '#676E95' },
    LspReferenceText = { underline = true },
    lualine_buffers_active = {
      fg = '#AB47BC',
      italic = true,
    },
    IndentBlanklineContextChar = { fg = '#AB47BC' },
    PmenuThumb = { fg = '#A6ACCD', bg = '#676E95' },

    NavicIconsFile = { fg = material_colors.editor.title },
    NavicIconsNamespace = { fg = material_colors.main.yellow },
    NavicIconsMethod = { fg = material_colors.main.blue },
    NavicIconsProperty = { fg = material_colors.main.purple },
    NavicIconsField = { fg = material_colors.main.cyan },
    NavicIconsVariable = { fg = material_colors.main.paleblue },
    NavicIconsString = { fg = material_colors.main.orange },
    NavicIconsBoolean = { fg = material_colors.main.yellow },
    NavicIconsNull = { fg = material_colors.main.red },
    NavicText = { fg = material_colors.editor.fg },
  }, -- Overwrite highlights with your own

  contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
    'terminal', -- Darker terminal background
    'packer', -- Darker packer background
    'qf', -- Darker qf list background
  },
})

vim.cmd('colorscheme material')

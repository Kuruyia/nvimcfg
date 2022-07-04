-- Settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.number = true
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

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Plugins
require('plugins')

-- Lualine
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},

  extensions = {}
})

-- Git signs
require('gitsigns').setup({
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },

  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`

  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`

  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`

  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`

  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },

  attach_to_untracked = true,

  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`

  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },

  current_line_blame_formatter = function() return '<author>, <author_time:%Y-%m-%d> - <summary>' end,

  sign_priority = 6,

  update_debounce = 100,

  status_formatter = nil, -- Use default

  max_file_length = 40000,

  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },

  yadm = {
    enable = false
  },
})

-- Telescope
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
                                       -- the default case_mode is 'smart_case'
    }
  }
}

require('telescope').load_extension('fzf')

vim.keymap.set('n', ';', '<cmd>Telescope find_files<cr>')

-- Bufferline
require('bufferline').setup({
    options = {
        mode = 'tabs'
    }
})

-- Autopairs
require('nvim-autopairs').setup()

-- LSP
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

-- nvim-cmp
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    },
    {
        { name = 'buffer' },
    }),
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    formatting = {
        format = require('lspkind').cmp_format()
    }
})

-- LSP servers
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

-- Lua LSP server
if lspconfig.sumneko_lua then
    lspconfig.sumneko_lua.setup({
        capabilities = capabilities,

        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        }
    })
end

-- C/C++ LSP server
if lspconfig.clangd then
    lspconfig.clangd.setup({
        capabilities = capabilities
    })
end

-- Color scheme
vim.g.material_style = 'palenight'
require('material').setup({
	contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},

	italics = {
		comments = true, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},

	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		'terminal', -- Darker terminal background
		'packer', -- Darker packer background
		'qf' -- Darker qf list background
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},

	disable = {
		colored_cursor = true, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},

	lualine_style = 'stealth', -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

	custom_highlights = {}, -- Overwrite highlights with your own

	plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
		trouble = false,
		nvim_cmp = true,
		neogit = false,
		gitsigns = true,
		git_gutter = false,
		telescope = true,
		nvim_tree = false,
		sidebar_nvim = false,
		lsp_saga = false,
		nvim_dap = false,
		nvim_navic = false,
		which_key = false,
		sneak = false,
		hop = false,
		indent_blankline = false,
		nvim_illuminate = false,
	}
})

vim.cmd('colorscheme material')

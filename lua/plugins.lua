-- Ensure the package manager is present
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Get nvim version
local version = vim.version()

local todo_comments_branch = nil
if version.major == 0 and version.minor < 8 then
    todo_comments_branch = 'neovim-pre-0.8.0'
end


require('lazy').setup({
    -- Material color scheme
    -- https://github.com/marko-cerovac/material.nvim
    {
        'marko-cerovac/material.nvim',
        config = function()
            require('config.color_scheme')
        end
    },

    -- Lualine
    -- https://github.com/nvim-lualine/lualine.nvim
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        },
        config = function()
            require('config.lualine')
        end
    },

    -- Git signs
    -- https://github.com/lewis6991/gitsigns.nvim
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('config.gitsigns')
        end
    },

    -- Telescope
    -- https://github.com/nvim-telescope/telescope.nvim
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        },
        config = function()
            require('config.telescope')
        end
    },

    -- Autopairs
    -- https://github.com/windwp/nvim-autopairs
    {
        'windwp/nvim-autopairs',
        config = function()
            require('config.autopairs')
        end
    },

    -- Mason
    -- https://github.com/williamboman/mason.nvim#requirements
    {
        'williamboman/mason.nvim',
        config = function()
            require('config.mason')
        end
    },

    -- LSP
    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- https://github.com/neovim/nvim-lspconfig
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim'
        },
        config = function()
            require('config.mason_lspconfig')
        end
    },

    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function()
            require('config.lsp')
        end
    },

    -- nvim-cmp
    -- https://github.com/hrsh7th/nvim-cmp
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip'
        },
        config = function()
            require('config.cmp')
        end
    },

    -- LSP Kind
    -- https://github.com/onsails/lspkind.nvim
    'onsails/lspkind.nvim',

    -- Treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('config.treesitter')
        end
    },

    -- Indent blanklines
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config.indent_blanklines')
        end
    },

    -- vim-illuminate
    -- https://github.com/RRethy/vim-illuminate
    'RRethy/vim-illuminate',

    -- alpha-nvim
    -- https://github.com/goolord/alpha-nvim
    {
        'goolord/alpha-nvim',
        config = function()
            require('config.alpha')
        end
    },

    -- Todo Comments
    -- https://github.com/folke/todo-comments.nvim
    {
        'folke/todo-comments.nvim',
        branch = todo_comments_branch,
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function()
            require('config.todo_comments')
        end
    },

    -- FTerm
    -- https://github.com/numToStr/FTerm.nvim
    {
        'numToStr/FTerm.nvim',
        config = function()
            require('config.fterm')
        end
    },

    -- Tree
    -- https://github.com/nvim-tree/nvim-tree.lua
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            lazy = true
        },
        config = function()
            require('config.tree')
        end
    },

    -- Trouble
    -- https://github.com/folke/trouble.nvim
    {
        'folke/trouble.nvim',
        config = function()
            require('config.trouble')
        end
    },

    -- Sleuth
    -- https://github.com/tpope/vim-sleuth
    'tpope/vim-sleuth',

    -- Lspsaga
    -- https://github.com/glepnir/lspsaga.nvim
    {
        'glepnir/lspsaga.nvim',
        branch = 'main',
        config = function()
            require('config.lspsaga')
        end,
        dependencies = {
            {'nvim-tree/nvim-web-devicons'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    },

    -- lsp_lines
    -- https://git.sr.ht/~whynothugo/lsp_lines.nvim
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require('config.lsp_lines')
        end,
    },

    -- nvim-navic
    -- https://github.com/SmiteshP/nvim-navic
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            require('config.navic')
        end,
    },

    -- nvim-ts-autotag
    -- https://github.com/windwp/nvim-ts-autotag
    'windwp/nvim-ts-autotag',

    -- fugitive.vim
    -- https://github.com/tpope/vim-fugitive
    'tpope/vim-fugitive',
})

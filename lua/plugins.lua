return require('packer').startup(function()
    -- Packer can manage itself
    -- https://github.com/wbthomason/packer.nvim
    use {
        'wbthomason/packer.nvim'
    }

    -- Material color scheme
    -- https://github.com/marko-cerovac/material.nvim
    use {
        'marko-cerovac/material.nvim',
        config = function()
            require('config.color_scheme')
        end
    }

    -- Lualine
    -- https://github.com/nvim-lualine/lualine.nvim 
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        },
        config = function()
            require('config.lualine')
        end
    }

    -- Git signs
    -- https://github.com/lewis6991/gitsigns.nvim
    use {
        'lewis6991/gitsigns.nvim',
        tag = 'release', -- To use the latest release
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('config.gitsigns')
        end
    }

    -- Telescope
    -- https://github.com/nvim-telescope/telescope.nvim
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('config.telescope')
        end
    }

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    -- Bufferline
    -- https://github.com/akinsho/bufferline.nvim
    use {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('config.bufferline')
        end
    }

    -- Autopairs
    -- https://github.com/windwp/nvim-autopairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('config.autopairs')
        end
    }

    -- LSP
    -- https://github.com/neovim/nvim-lspconfig
    -- https://github.com/williamboman/nvim-lsp-installer/
    use {
        'williamboman/nvim-lsp-installer',
        config = function()
            require('config.lsp_installer')
        end
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/cmp-nvim-lsp'
        },
        config = function()
            require('config.lsp')
        end
    }

    -- nvim-cmp
    -- https://github.com/hrsh7th/nvim-cmp
    use {
        'hrsh7th/nvim-cmp',
        requires = {
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
    }

    -- LSP Kind
    -- https://github.com/onsails/lspkind.nvim
    use {
        'onsails/lspkind.nvim'
    }

    -- Discord Presence
    -- https://github.com/andweeb/presence.nvim
    use {
        'andweeb/presence.nvim',
        config = function()
            require('config.discord_presence')
        end
    }

    -- Treesitter
    -- https://github.com/nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
            require('config.treesitter')
        end
    }

    -- Indent blanklines
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('config.indent_blanklines')
        end
    }
    
    -- vim-illuminate
    -- https://github.com/RRethy/vim-illuminate
    use {
        'RRethy/vim-illuminate'
    }

    -- alpha-nvim
    -- https://github.com/goolord/alpha-nvim
    use {
        'goolord/alpha-nvim',
        config = function()
            require('config.alpha')
        end
    }
end)

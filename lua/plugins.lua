return require('packer').startup(function()
    -- Get nvim version
    local version = vim.version()

    -- Packer can manage itself
    -- https://github.com/wbthomason/packer.nvim
    use {
        'wbthomason/packer.nvim'
    }

    -- Impatient
    -- https://github.com/lewis6991/impatient.nvim
    use {
        'lewis6991/impatient.nvim',
        config = function()
           require('config.impatient')
        end
    }

    -- Material color scheme
    -- https://github.com/marko-cerovac/material.nvim
    use {
        'marko-cerovac/material.nvim',
        after = 'lualine.nvim',
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
        requires = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
            }
        },
        config = function()
            require('config.telescope')
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

    -- Mason
    -- https://github.com/williamboman/mason.nvim#requirements
    use {
        'williamboman/mason.nvim',
        config = function()
            require('config.mason')
        end
    }

    -- LSP
    -- https://github.com/williamboman/mason-lspconfig.nvim
    -- https://github.com/neovim/nvim-lspconfig
    use {
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'williamboman/mason.nvim'
        },
        config = function()
            require('config.mason_lspconfig')
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
        config = function()
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

    -- Todo Comments
    -- https://github.com/folke/todo-comments.nvim
    local todo_comments_branch = nil
    if version.major == 0 and version.minor < 8 then
        todo_comments_branch = 'neovim-pre-0.8.0'
    end

    use {
        'folke/todo-comments.nvim',
        branch = todo_comments_branch,
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
            require('config.todo_comments')
        end
    }

    -- FTerm
    -- https://github.com/numToStr/FTerm.nvim
    use {
        'numToStr/FTerm.nvim',
        config = function()
            require('config.fterm')
        end
    }

    -- Tree
    -- https://github.com/nvim-tree/nvim-tree.lua
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {'nvim-tree/nvim-web-devicons'},
        config = function()
            require('config.tree')
        end
    }

    -- Trouble
    -- https://github.com/folke/trouble.nvim
    use {
        'folke/trouble.nvim',
        config = function()
            require('config.trouble')
        end
    }

    -- nvim-texlabconfig
    -- https://github.com/f3fora/nvim-texlabconfig
    use({
        'f3fora/nvim-texlabconfig',
        config = function()
            require('config.texlabconfig')
        end,
        ft = { 'tex', 'bib' },
        run = 'go build -o '..vim.fn.stdpath('data')..'/bin/'
    })
end)

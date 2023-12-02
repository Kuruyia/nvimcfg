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

-- Add support for the LazyFile event
-- See: https://github.com/LazyVim/LazyVim/blob/879e29504d43e9f178d967ecc34d482f902e5a91/lua/lazyvim/util/plugin.lua#L64-L75
local Event = require('lazy.core.handler.event')

Event.mappings.LazyFile = { id = 'LazyFile', event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' } }
Event.mappings['User LazyFile'] = Event.mappings.LazyFile

-- Get nvim version
local version = vim.version()

local todo_comments_branch = nil
if version.major == 0 and version.minor < 8 then
  todo_comments_branch = 'neovim-pre-0.8.0'
end

require('lazy').setup({
  -- Catppuccin color scheme
  -- https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('config.color_scheme')
    end,
  },

  -- Lualine
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    config = function()
      require('config.lualine')
    end,
  },

  -- Git signs
  -- https://github.com/lewis6991/gitsigns.nvim
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufWritePre' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.gitsigns')
    end,
  },

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    keys = {
      { ';', '<cmd>Telescope find_files<cr>', desc = 'Open Telescope for finding files' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
    },
    config = function()
      require('config.telescope')
    end,
  },

  -- Autopairs
  -- https://github.com/windwp/nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('config.autopairs')
    end,
  },

  -- Fidget
  -- https://github.com/j-hui/fidget.nvim
  {
    'j-hui/fidget.nvim',
    config = function()
      require('config.fidget')
    end,
  },

  -- Mason
  -- https://github.com/williamboman/mason.nvim#requirements
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = function()
      require('config.mason')
    end,
  },

  -- LSP
  -- https://github.com/neovim/nvim-lspconfig
  {
    'neovim/nvim-lspconfig',
    event = 'LazyFile',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'j-hui/fidget.nvim',
    },
    config = function()
      require('config.lsp')
    end,
  },

  -- nvim-cmp
  -- https://github.com/hrsh7th/nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function()
      require('config.cmp')
    end,
  },

  -- LSP Kind
  -- https://github.com/onsails/lspkind.nvim
  {
    'onsails/lspkind.nvim',
    lazy = true,
  },

  -- Treesitter
  -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },
    event = { 'LazyFile', 'VeryLazy' },
    config = function()
      require('config.treesitter')
    end,
  },

  -- Indent blanklines
  -- https://github.com/lukas-reineke/indent-blankline.nvim
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'LazyFile',
    config = function()
      require('config.indent_blanklines')
    end,
  },

  -- vim-illuminate
  -- https://github.com/RRethy/vim-illuminate
  {
    'RRethy/vim-illuminate',
    event = 'LazyFile',
  },

  -- alpha-nvim
  -- https://github.com/goolord/alpha-nvim
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      require('config.alpha')
    end,
  },

  -- Todo Comments
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    event = 'LazyFile',
    branch = todo_comments_branch,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.todo_comments')
    end,
  },

  -- FTerm
  -- https://github.com/numToStr/FTerm.nvim
  {
    'numToStr/FTerm.nvim',
    keys = {
      { ',', '<cmd>lua require("FTerm").toggle()<cr>', desc = 'Open the floating terminal' },
    },
    config = function()
      require('config.fterm')
    end,
  },

  -- Neo-tree
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    keys = {
      { '\\', '<cmd>Neotree reveal<cr>', desc = 'Open the filesystem tree' },
    },
    branch = 'v3.x',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('config.neo_tree')
    end,
  },

  -- Trouble
  -- https://github.com/folke/trouble.nvim
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('config.trouble')
    end,
  },

  -- Sleuth
  -- https://github.com/tpope/vim-sleuth
  {
    'tpope/vim-sleuth',
    event = 'BufReadPre',
  },

  -- Lspsaga
  -- https://github.com/glepnir/lspsaga.nvim
  {
    'glepnir/lspsaga.nvim',
    event = 'LspAttach',
    keys = {
      { 'gh', '<cmd>Lspsaga finder<cr>', desc = 'Open the LSP symbol finder' },
      { 'ga', '<cmd>Lspsaga code_action<cr>', desc = 'Open the LSP code actions' },
      { 'gr', '<cmd>Lspsaga rename<cr>', desc = 'Open the LSP rename symbol' },
      { 'gd', '<cmd>Lspsaga peek_definition<cr>', desc = 'Open the LSP peek at symbol definition' },
      { 'gD', '<cmd>Lspsaga goto_definition<cr>', desc = 'Open the LSP go to symbol definition' },
      { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'Open the LSP hovering documentation' },
      { '<C-k>', '<cmd>Lspsaga hover_doc ++keep<cr>', desc = 'Open the LSP sticky documentation' },
    },
    branch = 'main',
    config = function()
      require('config.lspsaga')
    end,
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      'nvim-treesitter/nvim-treesitter',
    },
  },

  -- lsp_lines
  -- https://git.sr.ht/~whynothugo/lsp_lines.nvim
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    config = function()
      require('config.lsp_lines')
    end,
  },

  -- nvim-ts-autotag
  -- https://github.com/windwp/nvim-ts-autotag
  {
    'windwp/nvim-ts-autotag',
    event = { 'LazyFile', 'VeryLazy' },
  },

  -- fugitive.vim
  -- https://github.com/tpope/vim-fugitive
  {
    'tpope/vim-fugitive',
    cmd = {
      'G',
      'Git',
    },
  },

  -- Comment
  -- https://github.com/numToStr/Comment.nvim
  {
    'numToStr/Comment.nvim',
    event = 'LazyFile',
    config = function()
      require('config.comment')
    end,
  },

  -- Persistence
  -- https://github.com/folke/persistence.nvim
  {
    'folke/persistence.nvim',
    event = { 'BufReadPre', 'BufWritePre' },
    config = function()
      require('config.persistence')
    end,
  },
})

# Neovim configuration files
My configuration files for Neovim.

## Installation
To install those configuration files, simply clone this repository to `~/.config/nvim`:
```
git clone git@github.com:Kuruyia/nvimcfg.git ~/.config/nvim
```

You will finally need to [install the plugin manager](https://github.com/wbthomason/packer.nvim#quickstart) and, in NeoVim, run:
```
:PackerSync
```

## Reset
In case of any problem, NeoVim can be reinitialized by deleting some directories:
```
rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
```

The plugin manager will need to be **reinstalled**.

## Autocompletion usage
To install an LSP server for a language, the following command must be used:
```
:LspInstall
```

The installed and available servers can be listed with this command:
```
:ListInstallInfo
```

## Treesitter usage
To install syntax highlighting for a language:
```
:TSInstall <lang>
```

To list possible languages:
```
:TSInstallInfo
```

If there is a problem with the plugin, try:
```
:TSUpdate
```

## Plugins
- [Packer - Plugin manager](https://github.com/wbthomason/packer.nvim)
- [Material - Theme](https://github.com/marko-cerovac/material.nvim)
- [Lualine - Status line manager](https://github.com/nvim-lualine/lualine.nvim)
- [Git signs - Git gutter signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope - Fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
- [Bufferline - Buffer line manager](https://github.com/akinsho/bufferline.nvim)
- [Autopairs - Automatically closes pairs](https://github.com/windwp/nvim-autopairs)
- [LSP Config - Configures the LSP client](https://github.com/neovim/nvim-lspconfig)
- [Mason - Easy installer for editor tooling](https://github.com/williamboman/mason.nvim)
- [Mason LSP Config - Bridges Mason with LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)
- [Nvim cmp - Completion engine](https://github.com/hrsh7th/nvim-cmp)
- [LSP Kind - Icons for LSP](https://github.com/onsails/lspkind.nvim)
- [Discord presence - Discord rich presence](https://github.com/andweeb/presence.nvim)
- [Treesitter - Better syntax highlighting](https://github.com/nvim-treesitter/nvim-treesitter)
- [Indent Blankline - Indentation guides](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Illuminate - Same-token highlighting](https://github.com/RRethy/vim-illuminate)
- [Alpha - Custom greeter](https://github.com/goolord/alpha-nvim)
- [Impatient - Faster startup time](https://github.com/lewis6991/impatient.nvim)
- [Todo Comments - Todo highlighting and search](https://github.com/folke/todo-comments.nvim)
- [FTerm - Floating terminal](https://github.com/numToStr/FTerm.nvim)
- [Tree - Sidebar file explorer](https://github.com/nvim-tree/nvim-tree.lua)

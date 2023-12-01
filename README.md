# Neovim configuration files
My configuration files for Neovim.

## Installation
To install those configuration files, simply clone this repository to `~/.config/nvim`:
```sh
git clone git@github.com:Kuruyia/nvimcfg.git ~/.config/nvim
```

Then, install some dependencies:
```sh
pacman -S cmake base-devel fd ripgrep
```

In Neovim, run:
```vim
:Lazy sync
```

## Reset
In case of any problem, Neovim can be reinitialized by deleting some directories:
```sh
rm -rf ~/.config/nvim/
rm -rf ~/.local/share/nvim/
```

## Autocompletion usage
To install an LSP server for a language, the following command must be used:
```vim
:LspInstall
```

The installed and available servers can be listed with this command:
```vim
:Mason
```

The following language servers are configured:
- [clangd - C++ language server](https://clangd.llvm.org/)
- [lua_ls - Lua language server](https://github.com/luals/lua-language-server)
- [ltex - LanguageTool language server for LaTeX and Markdown](https://github.com/valentjn/ltex-ls)
- [texlab - (La)TeX completion engine](https://github.com/latex-lsp/texlab)
- [tsserver - TypeScript and JavaScript language server](https://github.com/theia-ide/typescript-language-server)
- [volar - Vuejs language server](https://github.com/vuejs/language-tools/tree/master/packages/vue-language-server)
- [pyright - Python language server](https://github.com/microsoft/pyright)
- [gopls - Golang language server](https://github.com/golang/tools/tree/master/gopls)
- [terraformls - Terraform language server](https://github.com/hashicorp/terraform-ls)
- [rust_analyzer - Rust language server](https://github.com/rust-analyzer/rust-analyzer)
- [angularls - Angular language server](https://github.com/angular/vscode-ng-language-service)
- [html - HTML language server](https://github.com/hrsh7th/vscode-langservers-extracted)
- [r_language_server - R language server](https://github.com/REditorSupport/languageserver)
- [bufls - Protobuf language server](https://github.com/bufbuild/buf-language-server)

## Treesitter usage
To install syntax highlighting for a language:
```vim
:TSInstall <lang>
```

To list possible languages:
```vim
:TSInstallInfo
```

If there is a problem with the plugin, try:
```vim
:TSUpdate
```

## Plugins
- [Lazy - Plugin manager](https://github.com/folke/lazy.nvim)
- [Catppuccin - Color scheme](https://github.com/catppuccin/nvim)
- [Lualine - Status line manager](https://github.com/nvim-lualine/lualine.nvim)
- [Git signs - Git gutter signs](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope - Fuzzy finder](https://github.com/nvim-telescope/telescope.nvim)
- [Autopairs - Automatically closes pairs](https://github.com/windwp/nvim-autopairs)
- [Fidget - Notification manager](https://github.com/j-hui/fidget.nvim)
- [Mason - Easy installer for editor tooling](https://github.com/williamboman/mason.nvim)
- [Mason LSP Config - Bridges Mason with LSP Config](https://github.com/williamboman/mason-lspconfig.nvim)
- [LSP Config - Configures the LSP client](https://github.com/neovim/nvim-lspconfig)
- [Nvim cmp - Completion engine](https://github.com/hrsh7th/nvim-cmp)
- [LSP Kind - Icons for LSP](https://github.com/onsails/lspkind.nvim)
- [Treesitter - Better syntax highlighting](https://github.com/nvim-treesitter/nvim-treesitter)
- [Indent Blankline - Indentation guides](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Illuminate - Same-token highlighting](https://github.com/RRethy/vim-illuminate)
- [Alpha - Custom greeter](https://github.com/goolord/alpha-nvim)
- [Todo Comments - Todo highlighting and search](https://github.com/folke/todo-comments.nvim)
- [FTerm - Floating terminal](https://github.com/numToStr/FTerm.nvim)
- [Neo-tree - Sidebar file explorer](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Trouble - Pretty list for showing LSP stuff](https://github.com/folke/trouble.nvim)
- [Sleuth - Indentation style detection](https://github.com/tpope/vim-sleuth)
- [Lspsaga - Lightweight LSP utilities](https://github.com/glepnir/lspsaga.nvim)
- [Lsp lines - Error line rendering](https://git.sr.ht/~whynothugo/lsp_lines.nvim)
- [nvim-navic - Current code context winbar component](https://github.com/SmiteshP/nvim-navic)
- [nvim-ts-autotag - Automatic HTML/XML tag close and rename](https://github.com/windwp/nvim-ts-autotag)
- [Fugitive - Git wrapper "so awesome, it should be illegal"](https://github.com/tpope/vim-fugitive)
- [Comment - Smart and powerful commenting plugin](https://github.com/numToStr/Comment.nvim)
- [Persistence - Simple session management](https://github.com/folke/persistence.nvim)

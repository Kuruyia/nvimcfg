-- LSP servers
local capabilities = require('blink.cmp').get_lsp_capabilities()
local mason_registry = require('mason-registry')

-- Disable logging
vim.lsp.log.set_level(vim.log.levels.OFF)

-- For a list of LSP servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

-- Lua
if mason_registry.is_installed('lua-language-server') then
  local lua_ls_settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
    },
  }

  -- Add nvim settings if cwd is ~/.config/nvim/
  if vim.fn.getcwd() == vim.fn.stdpath('config') then
    lua_ls_settings.Lua.runtime = {
      version = 'LuaJIT',
    }

    lua_ls_settings.Lua.diagnostics = {
      globals = { 'vim' },
    }

    lua_ls_settings.Lua.workspace = {
      library = vim.api.nvim_get_runtime_file('', true),
    }
  end

  vim.lsp.config('lua_ls', {
    capabilities = capabilities,
    settings = lua_ls_settings,
  })

  vim.lsp.enable('lua_ls')
end

-- C/C++
if mason_registry.is_installed('clangd') then
  vim.lsp.config('clangd', {
    capabilities = capabilities,
  })

  vim.lsp.enable('clangd')
end

-- LaTeX / Markdown
local preview_executable
local preview_args

if vim.loop.os_uname().sysname == 'Linux' then
  preview_executable = 'zathura'
  preview_args = {
    '--synctex-editor-command',
    vim.fn.stdpath('data') .. [[/bin/nvim-texlabconfig -file '%{input}' -line %{line}]],
    '--synctex-forward',
    '%l:1:%f',
    '%p',
  }
end

if mason_registry.is_installed('ltex-ls-plus') then
  vim.lsp.config('ltex_plus', {
    capabilities = capabilities,
  })

  vim.lsp.enable('ltex_plus')
end

if mason_registry.is_installed('texlab') then
  vim.lsp.config('texlab', {
    capabilities = capabilities,
    settings = {
      texlab = {
        build = {
          forwardSearchAfter = true,
          onSave = true,
        },
        forwardSearch = {
          executable = preview_executable,
          args = preview_args,
        },
      },
    },
  })

  vim.lsp.enable('texlab')
end

-- TypeScript / JavaScript
if mason_registry.is_installed('typescript-language-server') then
  vim.lsp.config('ts_ls', {
    capabilities = capabilities,
  })

  vim.lsp.enable('ts_ls')
end

-- Python
if mason_registry.is_installed('ruff') then
  vim.lsp.config('ruff', {
    capabilities = capabilities,
  })

  vim.lsp.enable('ruff')
end

if mason_registry.is_installed('ty') then
  vim.lsp.config('ty', {
    capabilities = capabilities,
  })

  vim.lsp.enable('ty')
end

-- Golang
if mason_registry.is_installed('gopls') then
  vim.lsp.config('gopls', {
    capabilities = capabilities,
  })

  vim.lsp.enable('gopls')
end

-- Terraform
if mason_registry.is_installed('terraformls') then
  vim.lsp.config('terraformls', {
    capabilities = capabilities,
  })

  vim.lsp.enable('terraformls')
end

-- Rust
if mason_registry.is_installed('rust-analyzer') then
  vim.lsp.config('rust_analyzer', {
    capabilities = capabilities,
  })

  vim.lsp.enable('rust_analyzer')
end

-- HTML
if mason_registry.is_installed('html-lsp') then
  vim.lsp.config('html', {
    capabilities = capabilities,
  })

  vim.lsp.enable('html')
end

-- Protobuf
if mason_registry.is_installed('buf-language-server') then
  vim.lsp.config('buf_ls', {
    capabilities = capabilities,
  })

  vim.lsp.enable('buf_ls')
end

-- Typst
if mason_registry.is_installed('tinymist') then
  vim.lsp.config('tinymist', {
    capabilities = capabilities,
  })

  vim.lsp.enable('tinymist')
end

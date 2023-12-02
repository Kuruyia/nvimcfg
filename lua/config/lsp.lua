-- LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

-- Disable logging
vim.lsp.set_log_level('OFF')

-- Attach handler
local on_attach = function(client, bufnr)
  require('illuminate').on_attach(client)

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
end

-- For a list of LSP servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Lua LSP server
if lspconfig.lua_ls then
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

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = lua_ls_settings,
  })
end

-- C/C++ LSP server
if lspconfig.clangd then
  lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
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

if lspconfig.ltex then
  lspconfig.ltex.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

if lspconfig.texlab then
  lspconfig.texlab.setup({
    capabilities = capabilities,
    on_attach = on_attach,
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
end

-- TypeScript / JavaScript
if lspconfig.tsserver then
  lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Vuejs
local function get_typescript_server_path(root_dir)
  local found_dir_path = ''

  local function check_dir(path)
    found_dir_path = util.path.join(path, 'node_modules', 'typescript', 'lib')
    return util.path.exists(found_dir_path)
  end

  local has_found_dir = util.search_ancestors(root_dir, check_dir)

  if has_found_dir then
    return found_dir_path
  end
end

if lspconfig.volar then
  lspconfig.volar.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    end,
  })
end

-- Python
if lspconfig.pyright then
  lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Golang
if lspconfig.gopls then
  lspconfig.gopls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Terraform
if lspconfig.terraformls then
  lspconfig.terraformls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Rust
if lspconfig.rust_analyzer then
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Angular
if lspconfig.angularls then
  lspconfig.angularls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- HTML
if lspconfig.html then
  lspconfig.html.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- R
if lspconfig.r_language_server then
  lspconfig.r_language_server.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

-- Protobuf
if lspconfig.bufls then
  lspconfig.bufls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

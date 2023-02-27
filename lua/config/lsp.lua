-- LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Attach handler
local on_attach = function(client)
    require('illuminate').on_attach(client)
end

-- Check if a LSP is installed
local get_default_config = function(lsp_name)
    local server_config = require('lspconfig.server_configurations.'..lsp_name)

    if server_config == nil then
        return nil
    end

    return server_config.default_config
end

local check_lsp_installed = function(lsp_name)
    -- Get the default config for the LSP
    local lsp_config = get_default_config(lsp_name)

    if lsp_config == nil then
        vim.api.nvim_notify('Unable to check if the "'..lsp_config.name..'" LSP is installed.', vim.log.levels.ERROR, {})
        return false
    end

    if lsp_config.cmd == nil then
        vim.api.nvim_notify('Unable to check the cmd of the "'..lsp_config.name..'" LSP.', vim.log.levels.ERROR, {})
        return false
    end

    -- Check if the executable is present
    for _, v in pairs(lsp_config.cmd) do
        if vim.fn.executable(v) == 1 then
            return true
        end
    end
end

-- For a list of LSP servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Lua LSP server
if lspconfig.lua_ls and check_lsp_installed(lspconfig.lua_ls.name) then
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
            version = 'LuaJIT'
        }

        lua_ls_settings.Lua.diagnostics = {
            globals = {'vim'}
        }

        lua_ls_settings.Lua.workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
        }
    end

    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = lua_ls_settings
    })
end

-- C/C++ LSP server
if lspconfig.clangd and check_lsp_installed(lspconfig.clangd.name) then
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- LaTeX / Markdown
local preview_executable
local preview_args

if (vim.loop.os_uname().sysname == "Linux") then
    preview_executable = 'zathura'
    preview_args = {
        '--synctex-editor-command',
        vim.fn.stdpath('data')..[[/bin/nvim-texlabconfig -file '%{input}' -line %{line}]],
        '--synctex-forward',
        '%l:1:%f',
        '%p',
    }
end

if lspconfig.ltex and check_lsp_installed(lspconfig.ltex.name) then
    lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

if lspconfig.texlab and check_lsp_installed(lspconfig.texlab.name) then
    lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            texlab = {
                build = {
                    forwardSearchAfter = true,
                    onSave = true
                },
                forwardSearch = {
                    executable = preview_executable,
                    args = preview_args
                }
            }
        }
    })
end

-- TypeScript / JavaScript
if lspconfig.tsserver and check_lsp_installed(lspconfig.tsserver.name) then
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Vuejs
if lspconfig.vuels and check_lsp_installed(lspconfig.vuels.name) then
    lspconfig.vuels.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Python
if lspconfig.pyright and check_lsp_installed(lspconfig.pyright.name) then
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Golang
if lspconfig.gopls and check_lsp_installed(lspconfig.gopls.name) then
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Terraform
if lspconfig.terraformls and check_lsp_installed(lspconfig.terraformls.name) then
    lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Rust
if lspconfig.rust_analyzer and check_lsp_installed(lspconfig.rust_analyzer.name) then
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

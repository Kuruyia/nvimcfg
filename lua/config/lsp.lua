-- LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Attach handler
local on_attach = function(client)
    require('illuminate').on_attach(client)
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
if lspconfig.clangd then
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

if lspconfig.ltex then
    lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = on_attach
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
if lspconfig.tsserver then
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Vuejs
if lspconfig.vuels then
    lspconfig.vuels.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Python
if lspconfig.pyright then
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Golang
if lspconfig.gopls then
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Terraform
if lspconfig.terraformls then
    lspconfig.terraformls.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

-- Rust
if lspconfig.rust_analyzer then
    lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

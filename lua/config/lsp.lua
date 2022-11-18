-- LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Attach handler
local on_attach = function(client)
    require('illuminate').on_attach(client)
end

-- For a list of LSP servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- Lua LSP server
if lspconfig.sumneko_lua then
    lspconfig.sumneko_lua.setup({
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        },
        on_attach = on_attach
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
if lspconfig.ltex then
    lspconfig.ltex.setup({
        capabilities = capabilities,
        on_attach = on_attach
    })
end

if lspconfig.texlab then
    lspconfig.texlab.setup({
        capabilities = capabilities,
        on_attach = on_attach
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

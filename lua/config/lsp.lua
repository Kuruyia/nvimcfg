-- LSP servers
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

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
        on_attach = function(client)
            require('illuminate').on_attach(client)
        end
    })
end

-- C/C++ LSP server
if lspconfig.clangd then
    lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = function(client)
            require('illuminate').on_attach(client)
        end
    })
end

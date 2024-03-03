require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" , "clangd" , "bashls", "jedi_language_server", "rust_analyzer", "jdtls", "yamlls", "asm_lsp", "ansiblels", "hls"}
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
require("lspconfig").clangd.setup {
    capabilities = capabilities,
}
require("lspconfig").bashls.setup {
    capabilities = capabilities,
}
require("lspconfig").jedi_language_server.setup {
    capabilities = capabilities,
}
require("lspconfig").rust_analyzer.setup {
    capabilities = capabilities,
}
require("lspconfig").jdtls.setup {
    capabilities = capabilities,
}
require("lspconfig").yamlls.setup {
    capabilities = capabilities,
}
require("lspconfig").asm_lsp.setup {
    capabilities = capabilities,
}
require("lspconfig").ansiblels.setup {
    capabilities = capabilities,
}
require("lspconfig").hls.setup {
    capabilities = capabilities,
}

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "clangd", "bashls", "jedi_language_server", "rust_analyzer",
        "jdtls", "yamlls", "asm_lsp", "ansiblels", "tsserver",
        "als", "nim_langserver", "solargraph"
    }
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local servers = {
    "lua_ls", "clangd", "bashls", "jedi_language_server", "rust_analyzer",
    "jdtls", "yamlls", "asm_lsp", "ansiblels", "tsserver", "solargraph",
}

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

lspconfig.als.setup {
    capabilities = capabilities,
    settings = {
        ada = {
            projectFile = "project.gpr",
            scenarioVariables = { ... }
        }
    }
}

lspconfig.nim_langserver.setup {
    capabilities = capabilities,
    settings = {
        nim = {
            nimsuggestPath = "~/.nimble/bin/nimsuggest"
        }
    }
}

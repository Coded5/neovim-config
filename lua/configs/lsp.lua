require('mason').setup()

local exclude = {"rust_analyzer", "jdtls"}
local mason_lspconfig = require('mason-lspconfig')
require("mason-lspconfig").setup {
    automatic_enable = {
        exclude = exclude
    }
}

local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()
local on_attach = require("configs.keymaps").on_attach()


local in_exclude = function (val)
    for _, excluded in ipairs(exclude) do
        if excluded == val then
            return true
        end
    end

    return false
end

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
   if not in_exclude(server) then
        lspconfig[server].setup {
           capabilities = capabilities,
           on_attach = on_attach
        }
   end
end

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

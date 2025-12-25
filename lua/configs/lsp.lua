require("mason").setup()
require("mason-lspconfig").setup() -- Optional, but good if you use ensure_installed

local installed_servers = require("mason-lspconfig").get_installed_servers()

for _, server in ipairs(installed_servers) do
	if server ~= "rust_analyzer" then
		vim.lsp.enable(server)
	end
end

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

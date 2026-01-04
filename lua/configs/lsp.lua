vim.lsp.config("svelte", require("configs.lsp.svelte"))

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

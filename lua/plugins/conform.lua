return {
	{
		"stevearc/conform.nvim",
		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				-- typescript = { "prettier" },
				-- javascript = { "prettier" },
				-- svelte = { "prettier" },
				-- html = { "prettier" },
				-- css = { "prettier" },
				-- json = { "prettier" },
				-- markdown = { "prettier" },
			},
		},
	},
}

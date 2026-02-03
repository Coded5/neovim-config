return {
	{
		"stevearc/conform.nvim",
		opts = {
			log_level = vim.log.levels.DEBUG,
			format_on_save = function(bufnr)
				-- Define filetypes to disable
				local ignore_filetypes = { "yaml", "sql", "conf", "pl" }
				if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
					return
				end
				-- Default formatting options
				return { timeout_ms = 1500, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				typescript = { "eslint_d" },
				javascript = { "eslint_d" },
				svelte = { "eslint_d" },
				html = { "eslint_d" },
				css = { "prettier" },
				json = { "prettier" },
				markdown = { "prettier" },
			},
		},
	},
}

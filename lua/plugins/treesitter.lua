return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"css",
					"javascript",
					"typescript",
					"java",
					"rust",
					"svelte",
					"vimdoc",
					"vim",
					"c",
				},
				sync_install = false,
				auto_install = true,
				ignore_install = {},
				highlight = {
					enable = true,
				},
			})
		end,
		lazy = false,
	},
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		options = {
			icons_enabled = true,
			globalstatus = true,
		},
		config = function()
			vim.g.laststatus = 3
			require("lualine").setup()
		end,
	},
}

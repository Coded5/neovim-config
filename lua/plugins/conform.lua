return {
	{
		"stevearc/conform.nvim",
		enabled = false,
		opts = {},
		config = function()
			require("configs.conform")
		end,
	},
}

return {
	{
		"mfussenegger/nvim-dap",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
}

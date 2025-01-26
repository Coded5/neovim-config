return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		config = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzaer"] = {
							diagnostic = {
								refreshSupport = false, --server request cancelled workaround
							},
						},
					},
				},
			}
		end,
	},
}

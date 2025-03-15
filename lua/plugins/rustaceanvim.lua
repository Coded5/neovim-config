return {
	{
		"mrcjkb/rustaceanvim",
		version = "^5",
		lazy = false,
		config = function()
			-- local registry = require("mason-registry")

			-- local codelldb = registry.get_package("codelldb"):get_install_path() .. "/extension"
			-- local util = require("lspconfig/util")

			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzaer"] = {
							diagnostic = {
								refreshSupport = false, --server request cancelled workaround
							},
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
				-- dap = {
				-- 	autoload_configuration = true,
				-- 	adapter = require("rustaceanvim.config").get_codelldb_adapter(
				-- 		codelldb .. "/adapter/codelldb",
				-- 		codelldb .. "/lldb/lib/libllsd.so"
				-- 	),
				-- },
			}
		end,
	},
}

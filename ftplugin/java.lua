-- JDTLS (Java LSP) configuration
local jdtls = require("jdtls")
local home = vim.env.HOME -- Get the home directory

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.jdtls-workspace/" .. project_name

local system_os = ""

-- Determine OS
if vim.fn.has("mac") == 1 then
	system_os = "mac"
elseif vim.fn.has("unix") == 1 then
	system_os = "linux"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
	system_os = "win"
else
	print("OS not found, defaulting to 'linux'")
	system_os = "linux"
end

-- Needed for debugging
local bundles = {
	vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
}

-- Needed for running/debugging unit tests
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", 1), "\n"))

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"/usr/lib/jvm/java-21-openjdk-amd64/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_" .. system_os,
		"-data",
		workspace_dir,
	},

	-- This is the default if not provided, you can remove it. Or adjust as needed.
	-- One dedicated LSP server & client will be started per unique root_dir
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	settings = {
		java = {
			home = "/usr/lib/jvm/java-21-openjdk-amd64/",
			-- home = "/mnt/c/Users/phoen/.jdks/openjdk-23.0.1/",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					-- {
					-- 	name = "JavaSE-23",
					-- 	path = "/mnt/c/Users/phoen/.jdks/openjdk-23.0.1/",
					-- },
					-- {
					-- 	name = "JavaSE-8",
					-- 	path = "/usr/lib/jvm/java-8-openjdk-amd64/",
					-- },
					-- {
					-- 	name = "JavaSE-11",
					-- 	path = "/usr/lib/jvm/java-11-openjdk-amd64/",
					-- },
					-- {
					-- 	name = "JavaSE-17",
					-- 	path = "/usr/lib/jvm/java-17-openjdk-amd64/",
					-- },
					{
						name = "JavaSE-21",
						path = "/usr/lib/jvm/java-21-openjdk-amd64/",
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				-- Formatting works by default, but you can refer to a specific file/URL if you choose
				-- settings = {
				--   url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
				--   profile = "GoogleStyle",
				-- },
			},
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
				importOrder = {
					"java",
					"javax",
					"com",
					"org",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
		},
	},
	-- Needed for auto-completion with method signatures and placeholders
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		-- References the bundles defined above to support Debugging and Unit Testing
		bundles = bundles,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
}

function nnoremap(rhs, lhs, bufopts, desc)
	bufopts.desc = desc
	vim.keymap.set("n", rhs, lhs, bufopts)
end

-- Needed for debugging
config["on_attach"] = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	nnoremap("gD", vim.lsp.buf.declaration, bufopts, "Go to declaration")
	nnoremap("gd", vim.lsp.buf.definition, bufopts, "Go to definition")
	nnoremap("gi", vim.lsp.buf.implementation, bufopts, "Go to implementation")
	nnoremap("K", vim.lsp.buf.hover, bufopts, "Hover text")
	nnoremap("<C-k>", vim.lsp.buf.signature_help, bufopts, "Show signature")
	nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder, bufopts, "Add workspace folder")
	nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts, "Remove workspace folder")
	nnoremap("<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts, "List workspace folders")
	nnoremap("<space>D", vim.lsp.buf.type_definition, bufopts, "Go to type definition")
	nnoremap("<space>rn", vim.lsp.buf.rename, bufopts, "Rename")
	nnoremap("<space>ca", vim.lsp.buf.code_action, bufopts, "Code actions")
	vim.keymap.set(
		"v",
		"<space>ca",
		"<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
		{ noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
	)
	nnoremap("<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts, "Format file")

	-- Java extensions provided by jdtls
	nnoremap("<C-o>", jdtls.organize_imports, bufopts, "Organize imports")
	nnoremap("<space>ev", jdtls.extract_variable, bufopts, "Extract variable")
	nnoremap("<space>ec", jdtls.extract_constant, bufopts, "Extract constant")
	vim.keymap.set(
		"v",
		"<space>em",
		[[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
		{ noremap = true, silent = true, buffer = bufnr, desc = "Extract method" }
	)

	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)

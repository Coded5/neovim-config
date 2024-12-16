local cmp = require("cmp")
local luasnip = require("luasnip")

local select_opts = { behavior = cmp.SelectBehavior.Select }

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	sources = cmp.config.sources({
		{ name = "luasnip", keyword_length = 5 },
		{ name = "nvim_lsp", keyword_length = 3 },
	}, {
		{ name = "buffer", keyword_length = 4 },
		{ name = "path" },
	}),

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(select_opts),
		["<S-Tab>"] = cmp.mapping.select_next_item(select_opts),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
})


return {
    {
        'saghen/blink.cmp',
        dependencies = {
            'rafamadriz/friendly-snippets'
        },
        version = '1.*',
        opts = {
            keymap = {
                preset = "enter",
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<C-k>'] = false,
                ['<C-K>'] = { 'show_signature', 'hide_signature', 'fallback'}

            },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = {
                    auto_show = true
                }
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' }
            },
            fuzzy = {
                implementation = "prefer_rust_with_warning"
            },
            -- opts_extend = {
            --     "sources.default"
            -- }
        }
    }
}

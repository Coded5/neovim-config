return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            -- ensure_installed = {
            --     "lua_ls",
            --     "pyright",
            --     "rust_analyzer" ,
            --     "jdtls",
            --     "eslint",
            --     "ts_ls",
            --     "html",
            --     "cssls",
            --     "clangd"
            -- }
        },
        dependencies = {
            { 
                "mason-org/mason.nvim",
                opts = {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                } 
            },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require('configs.lsp')
        end
    },
}

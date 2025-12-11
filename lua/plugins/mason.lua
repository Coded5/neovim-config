return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        priority = 1000,
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
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
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_isntalled = {
                "clangd",
                "cmake-language-server",
                "css-lsp",
                "emmet-language-server",
                "html-lsp",
                "java-debug-adapter",
                "jdtls",
                "lua-language-server",
                "prettier",
                "prettierd",
                "rust-analyzer",
                "stylua",
                "typescript-language-server",
            },
            integrations = {
                ["mason-lspconfig"] = true,
            },
        },
    },
}

return {
    {
        "mrcjkb/rustaceanvim",
        version = "^5",
        lazy = false,
        config = function()
            local mason_registry = require('mason-registry')
            local extension_path = vim.fn.expand("$MASON/packages/codelldb/extension/")
            local codelldb_path = extension_path .. "adapter/codelldb"
            local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
            local cfg = require('rustaceanvim.config')

            vim.g.rustaceanvim = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
                }
            }
        end,
    },
}

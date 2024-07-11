local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp("codeAction") end, { silent = true, buffer = bufnr })
vim.keymap.set("n", "<C-space>", function() vim.cmd.RustLsp { 'hover', 'actions'} end, { silent = true, buffer = bufnr })



-- local codelldb_ext_path = vim.env.HOME .. "/.vscode-server/extensions/vadimcn.vscode-lldb/extension/"
-- local codelldb_path = codelldb_ext_path .. 'adapter/codelldb'
-- local util = require("lspconfig/util")
-- local codelldb = require("mason-registry").get_package('codelldb'):get_install_path() .. '/extension'
--
-- vim.g.rustaceanvim = {
--   server = {
--     default_settings = {
--       filetypes = {"rust"},
--       root_dir = util.root_pattern("Cargo.toml"),
--       ['rust-analyzer'] = {
--         cargo = {
--           allFeatures = true
--         }
--       }
--     }
--   },
--   dap = {
--     autoload_configuration = true,
--     adapter = require('rustaceanvim.config').get_codelldb_adapter(
--       codelldb .. '/adapter/codelldb',
--       codelldb .. '/lldb/lib/liblldb.so'
--     )
--   }
-- }


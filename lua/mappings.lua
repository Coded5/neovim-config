require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("x", "<Leader>p", "\"_dP")

map("n", "<A-k>", "<cmd>m -2<cr>")
map("n", "<A-j>", "<cmd>m +1<cr>")

map("n", "<Leader>q", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

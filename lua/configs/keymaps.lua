local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Clipboard

map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("n", "<leader>P", '"+P', { desc = "PASTE from clipboard" })
map("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })

--Switching between windows

map("n", "<C-k>", "<CMD>wincmd k<CR>")
map("n", "<C-j>", "<CMD>wincmd j<CR>")
map("n", "<C-h>", "<CMD>wincmd h<CR>")
map("n", "<C-l>", "<CMD>wincmd l<CR>")

--Nvim Tree

map("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", "<CMD>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

--Telescope

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

local on_attach = function(_, bufnr)
	map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
	map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
	map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
	map("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
	map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
	map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Reference" })

	map("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostic" })
end

return {
	on_attach = on_attach,
}

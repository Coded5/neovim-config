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

map("n", "<leader>ft", "<CMD>NvimTreeFindFile<CR>", { desc = "Reveal file in NvimTree" })

-- local on_attach = function(_, bufnr)
-- 	map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
-- 	map("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
-- 	map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
-- 	map("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })
-- 	map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
-- 	map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
-- 	map("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Reference" })
--
-- 	map("n", "<leader>d", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostic" })
-- end

-- Harpoon

local harpoon = require("harpoon")

map("n", "<leader>a", function()
	harpoon:list():add()
	print("Added to harpoon list")
end, { desc = "Add to harpoon list" })

map("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Show harpoon list" })

map("n", "grd", vim.diagnostic.open_float, { desc = "Open diagnostic" })

map("n", "<C-1>", function()
	harpoon:list():select(1)
end)
map("n", "<C-2>", function()
	harpoon:list():select(2)
end)
map("n", "<C-3>", function()
	harpoon:list():select(3)
end)
map("n", "<C-4>", function()
	harpoon:list():select(4)
end)

-- map("n", "<C-h>", function()
-- 	harpoon:list():select(1)
-- end)
-- map("n", "<C-t>", function()
-- 	harpoon:list():select(2)
-- end)
-- map("n", "<C-n>", function()
-- 	harpoon:list():select(3)
-- end)
-- map("n", "<C-s>", function()
-- 	harpoon:list():select(4)
-- end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<C-S-P>", function()
	harpoon:list():prev()
end)

map("n", "<C-S-N>", function()
	harpoon:list():next()
end)

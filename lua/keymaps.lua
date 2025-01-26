local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<leader>p", '"_dP')
map("n", "<A-j>", "ddp")
map("n", "<A-k>", "dd2kp")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Nvim tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Tree Focus" })
map("n", "<leader>z", "<cmd>NvimTreeFindFile<CR>", { desc = "Tree Find" })

-- telescope
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- switch between window

map("n", "<C-k>", "<cmd>wincmd k<CR>")
map("n", "<C-j>", "<cmd>wincmd j<CR>")
map("n", "<C-h>", "<cmd>wincmd h<CR>")
map("n", "<C-l>", "<cmd>wincmd l<CR>")

-- toggle term

map("n", "<C-t>", '<cmd>exe v:count1 . "ToggleTerm"<CR>')

map()

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<esc>", [[<C-\><C-n>]], opts)
	map("t", "jk", [[<C-\><C-n>]], opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

map("n", "<C-/>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })

map("n", "<Leader>q", function()
	vim.lsp.inlay_hint.enable(0, not lsp.inlay_hint.is_enabled())
end)

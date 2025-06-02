local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<leader>p", '"_dP')
map("n", "<A-j>", "ddp")
map("n", "<A-k>", "dd2kp")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<esc>", "<cmd>nohlsearch<cr>")

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
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

map("n", "<Leader>s", function()
    local new_config = not vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = new_config
    })
end)

map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
    "n",
    "<Leader>dd",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

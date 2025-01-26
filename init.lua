vim.g.mapleader = " "

vim.opt.cursorlineopt = "both"
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.encoding = "UTF-8"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.laststatus = 3

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end

	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require("lazy").setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

lazy.setup({
	spec = {
		{ import = "plugins" },
	},
	checker = { enabled = true, notify = false },
})

-- lazy.setup(require("plugins"))

vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})

require("keymaps")

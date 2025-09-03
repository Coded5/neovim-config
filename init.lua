vim.g.mapleader = " "

require("configs.options")
require("configs.lazy")
require("configs.keymaps")

require("scripts.clean_jdtls")
require("scripts.cd_config")

require("autocmds.nvimtree_changedir")

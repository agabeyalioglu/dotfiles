-- Leader key (must be before lazy)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core settings
require("config.options")
require("config.keymaps")
require("config.lazy")

-- Basic setup configuration
vim.cmd("source ~/.config/nvim/viml/vanilla.vim")
require("vanilla")

-- Lazy plugin setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("plugconfig")

require("confformat")

vim.cmd("source ~/.config/nvim/viml/plugconfig.vim")

local plugtestbench = require("plugbench")

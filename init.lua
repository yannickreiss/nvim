-- vim.cmd('source viml/init.vim')
-- Basic setup configuration
vim.cmd([[
set nocompatible
filetype on
filetype plugin on
syntax on
]])
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.encoding = "UTF-8"
vim.g.tex_flavor = "latex"
vim.opt.conceallevel = 2
vim.opt.guifont = "DroidSansMono Nerd Font 11"

-- set colorscheme
vim.opt.termguicolors = true
vim.cmd([[
colorscheme slate
]])

-- vim.cmd('source ~/.config/nvim/viml/plugins.vim')
require("plugins")

-- UltiSnipsConfig
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }

-- indentLine config
vim.g.indentLine_char = "┆"

-- NERDTree Config
vim.g.NERDTreeShowHidden = 1

-- Vim Lexima
vim.g.lexima_enable_basic_rules = 1
vim.g.lexima_enable_newline_rules = 1

-- Nvim Formatter
-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- Treesitter config
local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "python", "c", "cpp", "lua", "make", "markdown" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = {"langtodisable"},
		extended_mode = true,
		max_file_lines = 50000,
		-- colors = {}, -- hex strings
		-- termcolors = {}, -- color names
	},
})

-- Let Treesitter fold with <zo> and <zc>, but keeps buffers unfolded on enter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Mason setup
require("mason").setup(require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}))

require("mason-lspconfig").setup({
	ensure_installed = { "clangd", "cmake", "jdtls", "texlab", "pylsp" },
})

require("mason-lspconfig").setup_handlers({
	function(clangd)
		require("lspconfig")[clangd].setup({})
	end,
})

local wilder = require("wilder")
wilder.setup({
	modes = { ":", "/", "?" },
	next_key = "<Tab>",
	previous_key = "<S-Tab>",
	accept_key = "<c-k>",
	reject_key = "<Up>",
})

require("code-completion")

-- neovide configuration
if vim.g.neovide then
	vim.o.guifont = "DroidSansMono Nerd Font:8"
	vim.g.neovide_scale_factor = 1.0
end

vim.cmd("source ~/.config/nvim/viml/legacyconf.vim")
vim.cmd("source ~/.config/nvim/viml/macros.vim")

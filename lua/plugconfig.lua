-- UltiSnips Configuration
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-h>"
vim.g.UltiSnipsEditSplit = "vertical"
vim.g.UltiSnipsSnippetDirectories = { "~/.config/nvim/UltiSnips" }

-- NERDTree Config
vim.g.NERDTreeShowHidden = 1

-- Lexima
vim.g.lexima_enable_basic_rules = 1
vim.g.lexima_enable_newline_rules = 1

-- NERDTree Config
vim.g.NERDTreeDirArrowExpandable = "▸"
vim.g.NERDTreeDirArrowCollapsible = "▾"

-- Git-Blame configuration
vim.g.gitblame_message_template = "		=>	<author> • <date> • <summary>"
vim.g.gitblame_date_format = "%r"

-- Intendation basics
require("ibl").setup()

-- Code completion
require("code-completion")

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
	-- ensure_installed = { "clangd", "cmake", "jdtls", "texlab", "pylsp" },
})

require("mason-lspconfig").setup_handlers({
	function(clangd)
		require("lspconfig")[clangd].setup({})
	end,
	["als"] = function()
		require("lspconfig").als.setup({
			settings = {
				ada = {
					projectFile = "default.gpr",
				},
			},
		})
	end,
})

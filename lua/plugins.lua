return require("packer").startup(function(use)
	-- Configurations will go here soon
	use("wbthomason/packer.nvim")
	use("preservim/nerdtree")
	use("Xuyuanp/nerdtree-git-plugin")
	use("tpope/vim-surround")
	use("SirVer/ultisnips")
	use("powerline/powerline")
	use("vim-airline/vim-airline")
	use("vim-airline/vim-airline-themes")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "junegunn/fzf", run = ":call fzf#install()" })
	use("junegunn/fzf.vim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("mfussenegger/nvim-dap")
	use("f-person/git-blame.nvim")
	use("mfussenegger/nvim-lint")
	use("p00f/nvim-ts-rainbow")
	use("cohama/lexima.vim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-cmdline")
	use("dmitmel/cmp-cmdline-history")
	use("amarakon/nvim-cmp-lua-latex-symbols")
	use("prabirshrestha/async.vim")
	use("prabirshrestha/vim-lsp")
	use("nvim-tree/nvim-web-devicons")
	use("mg979/vim-visual-multi")
	use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })
	use("quangnguyen30192/cmp-nvim-ultisnips")
	use("ryanoasis/vim-devicons")
	use("mhartington/formatter.nvim")
	use("tzachar/highlight-undo.nvim")
	use("folke/tokyonight.nvim")
	use("patstockwell/vim-monokai-tasty")
	use("yannickreiss/nvim-navigator")
	use("tpope/vim-speeddating")
	use("jaredgorski/SpaceCamp")
	use("projekt0n/github-nvim-theme")
	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper", -- alt = 'doom'
				config = {
					week_header = {
						enable = true,
					},
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
end)

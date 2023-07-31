--vim.cmd('source viml/init.vim')
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
vim.opt.encoding = 'UTF-8'
vim.g.tex_flavor = "latex"
vim.g.clipboard = true
vim.opt.conceallevel = 2
vim.opt.guifont = "DroidSansMono Nerd Font 11"

-- set colorscheme
vim.opt.termguicolors = true
vim.cmd([[
colorscheme slate
]])

-- vim.cmd('source ~/.config/nvim/viml/plugins.vim')
require('plugins')

-- UltiSnipsConfig
vim.g.UltiSnipsExpandTrigger="<tab>"
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
vim.g.UltiSnipsJumpBackwardTrigger="<S-Tab>"
vim.g.UltiSnipsEditSplit="vertical"
vim.g.UltiSnipsSnippetDirectories={"/home/nick/.vim/UltiSnips"}

-- indentLine config
vim.g.indentLine_char = '▏'

-- NERDTree Config
vim.g.NERDTreeShowHidden = 1

-- Vim Lexima 
vim.g.lexima_enable_basic_rules = 1
vim.g.lexima_enable_newline_rules = 1

-- YCM config
-- replace tab by crtl-k
-- vim.cmd("let g:ycm_key_list_select_completion = ['<c-k>']")
-- vim.cmd("inoremap <expr> <Tab> pumvisible() ? '\\<c-k>' : 'ᐅ'")
-- vim.g.ycm_global_ycm_extra_conf = '~/.config/nvim/python/.ycm_extra_conf.py'

-- Treesitter config
local configs = require'nvim-treesitter.configs'
configs.setup {
	ensure_installed = {'python', 'c', 'cpp', 'lua', 'make', 'markdown'},
	highlight = {
		enable = true;
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
	}
}

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
            package_uninstalled = "✗"
        }
    }
}))

require("mason-lspconfig").setup({
	ensure_installed = {"clangd", "cmake", "jdtls", "texlab", "pylsp"}
})

require("mason-lspconfig").setup_handlers {
	function (clangd)
		require("lspconfig")[clangd].setup {}
	end
}

require("code-completion")

vim.cmd('source ~/.config/nvim/viml/legacyconf.vim')

return require('packer').startup(function(use)
  -- Configurations will go here soon
 use 'wbthomason/packer.nvim'
--  use 'dense-analysis/ale'
 use 'preservim/nerdtree'
 use 'Xuyuanp/nerdtree-git-plugin'
 use 'tpope/vim-surround'
 use 'SirVer/ultisnips'
 use 'vim-airline/vim-airline'
 use {
   'nvim-treesitter/nvim-treesitter',
   run = function()
     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
     ts_update()
   end,
 }
 use { 'gelguy/wilder.nvim' }
 use { 'junegunn/fzf', run = ":call fzf#install()" }
 use 'junegunn/fzf.vim'
-- use 'Valloric/YouCompleteMe'
 use 'williamboman/mason.nvim'
 use 'williamboman/mason-lspconfig.nvim'
 use 'neovim/nvim-lspconfig'
 use 'mfussenegger/nvim-dap'
 use 'f-person/git-blame.nvim'
 use 'mfussenegger/nvim-lint'
 use 'lewis6991/gitsigns.nvim'
 use 'p00f/nvim-ts-rainbow'
 use 'cohama/lexima.vim'
 use 'hrsh7th/nvim-cmp' 
 use 'hrsh7th/cmp-nvim-lsp'
 use 'hrsh7th/cmp-nvim-lua'
 use 'hrsh7th/cmp-nvim-lsp-signature-help'
 use 'hrsh7th/cmp-path'
 use 'hrsh7th/cmp-buffer'
 use 'hrsh7th/cmp-calc'
 use 'amarakon/nvim-cmp-lua-latex-symbols'
 use 'prabirshrestha/async.vim'
 use 'prabirshrestha/vim-lsp'
 use 'nvim-tree/nvim-web-devicons'
 use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
 use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
 use 'quangnguyen30192/cmp-nvim-ultisnips'
 use 'ryanoasis/vim-devicons'
end)

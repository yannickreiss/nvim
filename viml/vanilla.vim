set nocompatible
filetype on
filetype plugin on
syntax on

colorscheme vim-monokai-tasty

" open builtin terminal
function OpenTerm()
	10 split
	terminal
endfunction
nnoremap <C-t> :call OpenTerm()<CR>

set splitright
set splitbelow

set clipboard+=unnamedplus

" set spellcheck according to Filetype
autocmd VimEnter * set spell spelllang=en_us

function Litde()
    set spell spelllang=de_de
endfunction

function Liten()
    set spell spelllang=en_us
endfunction

nnoremap <M-e> :call Liten()<CR>
nnoremap <M-g> :call Litde()<CR>

" Theme
nnoremap <M-+> :colo tokyonight-day<CR>
nnoremap <M--> :colo tokyonight-night<CR>

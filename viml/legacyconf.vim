" NERDTree remap
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <C-a> :NERDTreeToggle<CR>

" open builtin terminal
function OpenTerm()
	vsplit
	terminal
endfunction
nnoremap <C-t> :call OpenTerm()<CR>

" open new files right/below
set splitright
set splitbelow

set clipboard+=unnamedplus

" Autoformat on save
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

" set spellcheck according to Filetype
autocmd VimEnter * set spell spelllang=en_us

function Litde()
    set spell spelllang=de_de
endfunction

function Liten()
    set spell spelllang=en_us
endfunction

nnoremap <C-e> :call Liten()<CR>
nnoremap <C-g> :call Litde()<CR>

" Theme
nnoremap <M-+> :colo morning<CR>
nnoremap <M--> :colo slate<CR>

" Fuzzy finder
nnoremap <C-f> :Lines<CR>

function RestoreSession()
	if @% == ""
		source ~/.config/nvim/lastSession.vim
	endif
endfunction

" Git-Blame configuration
let g:gitblame_message_template = '		=>	<author> • <date> • <summary>'
let g:gitblame_date_format = '%r'

if executable('vhdl-tool')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vhdl-tool',
        \ 'cmd': {server_info->['vhdl-tool', 'lsp']},
        \ 'whitelist': ['vhdl'],
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'vhdltool-config.yaml'))},
        \ })
endif

autocmd FileType vhdl setlocal omnifunc=lsp#complete

nnoremap <silent>    <C-0> <Cmd>BufferNext<CR>

" update function and call
function Update_Sys()
    PackerSync
    TSUpdate
    MasonUpdate
endfunction

nnoremap <M-u> :call Update_Sys()<CR>

" Call build function
function! Build()
    let l:filetype = &filetype

    if l:filetype == 'c' || l:filetype == 'cpp' || l:filetype == 'h' || l:filetype == 'hpp'
        execute 'make'
    elseif l:filetype == 'py' || l:filetype == 'python'
        execute '!python3 %'
    elseif l:filetype == 'tex'
        execute '!lualatex % < /dev/null'
    elseif l:filetype == 'rs'
        execute 'cargo run'
    elseif l:filetype == 'S'
        execute 'make'
    elseif l:filetype == 'verilog'
        execute 'verilator --binary %'
    else
        echo "Unsupported file type: " . l:filetype
    endif
endfunction

nnoremap <C-b> :call Build()<CR>
nnoremap <C-w> :bdelete<CR>
nnoremap <C-y> :b#<CR>

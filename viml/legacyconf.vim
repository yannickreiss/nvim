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

" Update Plugins and Treesitter languages
autocmd VimLeave * mksession! ~/.config/nvim/lastSession.vi

" set spellcheck according to Filetype
autocmd VimEnter * set spell spelllang=en_us

function Litde()
    set spell spelllang=de_de
endfunction

function Liten()
    set spell spelllang=en_us
endfunction

nnoremap <C-l> :call Liten()<CR>
nnoremap <C-m> :call Litde()<CR>

" Theme
" Light


" Dark
nnoremap <M-+> :colo morning<CR>
nnoremap <M--> :colo ron<CR>

" autosave for Markdown and Latex
set updatetime=800
autocmd CursorHold *.md w
" autocmd BufAdd *.md !okular %&
"terminator -e "latexmk -pdf -f </dev/null" &
nnoremap <C-y> :!latexmk -pdf -silent -f </dev/null <CR>

function RestoreSession()
	if @% == ""
		source ~/.config/nvim/lastSession.vim
	endif
endfunction

" Git-Blame configuration
let g:gitblame_message_template = '		=>	<author> • <summary> • <date>'
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

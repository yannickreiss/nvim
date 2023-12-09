" NERDTree remap
nmap <C-e> :NERDTreeToggle<CR>

" Autoformat on save
augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

nnoremap <silent>    <C-0> <Cmd>BufferNext<CR>

" update function and call
function Update_Sys()
    Lazy sync
    TSUpdate
endfunction

nnoremap <M-u> :call Update_Sys()<CR>

" Call build function
function! Build()
    let l:filetype = &filetype

    if l:filetype == 'c' || l:filetype == 'cpp' || l:filetype == 'h' || l:filetype == 'hpp'
        execute '!make'
    elseif l:filetype == 'py' || l:filetype == 'python'
        execute '!python3 %'
    elseif l:filetype == 'tex'
        execute '!lualatex % < /dev/null'
    elseif l:filetype == 'rs'
        execute 'cargo run'
    elseif l:filetype == 'S'
        execute '!make'
    elseif l:filetype == 'verilog'
        execute '!verilator --binary %'
    elseif l:filetype == 'rust'
        execute '!cargo run'
    elseif l:filetype == 'markdown'
        execute '!okular %&'
    else
        echo "Unsupported file type: " . l:filetype
    endif
endfunction

nnoremap <C-b> :call Build()<CR>
nnoremap <M-w> :bdelete<CR>
nnoremap <C-y> :b#<CR>

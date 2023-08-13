function Common()

endfunction

function Ctypes()
    let @c = "\<ESC>0i/*\<ESC>A */\<ESC>0j"
endfunction

" load common macros for all Filetypes
 autocmd BufEnter * :call Common()

" load c-type macros
 autocmd BufEnter *\.c Ctypes()

"" Block comment shortcut
augroup commentOut
  autocmd!
  autocmd BufRead,BufNewFile *.c,*.cpp,*.cc call s:commap_c()
  autocmd BufRead,BufNewFile *.py call s:commap_py()
augroup END

function! s:commap_c() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/\/\*\r\1\r\*\//<CR>:nohlsearch<CR>
  vmap ,u :s/[\*\/]\{2}\n//<CR>
endfunction

function! s:commap_py() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/"""\r\1\r"""/<CR>:nohlsearch<CR>
  vmap ,u :s/"\{3}\n//<CR>
endfunction

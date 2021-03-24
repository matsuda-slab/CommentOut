"" Block comment shortcut
augroup commentOut
  autocmd!
  autocmd BufRead,BufNewFile *.c,*.cpp,*.cc *.java *.css call s:commap_c()
  autocmd BufRead,BufNewFile *.py call s:commap_py()
  autocmd BufRead,BufNewFile *.html call s:commap_html()
  autocmd BufRead,BufNewFile *.sh call s:commap_sh()
augroup END

function! s:commap_c() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/\/\*\r\1\r\*\//<CR>:nohlsearch<CR>
  vmap ,u :s/[\*\/]\{2}\n//<CR>
endfunction

function! s:commap_py() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/"""\r\1\r"""/<CR>:nohlsearch<CR>
  vmap ,u :s/"\{3}\n//<CR>
endfunction

function! s:commap_html() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/<!--\r\1\r-->/<CR>:nohlsearch<CR>
  vmap ,u :s/[!-<>]\{3,}\n//<CR>
endfunction

function! s:commap_sh() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/<<COMMENTOUT\r\1\rCOMMENTOUT/<CR>:nohlsearch<CR>
  vmap ,u :s/.*COMMENTOUT\n//<CR>
endfunction

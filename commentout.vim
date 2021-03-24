"" Block comment shortcut
augroup commentOut
  autocmd!
  autocmd BufRead,BufNewFile *.c,*.cpp,*.cc,*.cs,*.css,*.m call s:commap_c()
  autocmd BufRead,BufNewFile *.java call s:commap_c()
  autocmd BufRead,BufNewFile *.js,*.css,*.php call s:commap_c()
  autocmd BufRead,BufNewFile *.py,*.r call s:commap_py()
  autocmd BufRead,BufNewFile *.html,*.xml call s:commap_html()
  autocmd BufRead,BufNewFile *.sh call s:commap_sh()
  autocmd BufRead,BufNewFile *.v,*.sv,*.go call s:commap_c()
  autocmd BufRead,BufNewFile *.pl call s:commap_perl()
  autocmd BufRead,BufNewFile *.rb call s:commap_ruby()
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

function! s:commap_perl() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/=pod\r\1\r=cut/<CR>:nohlsearch<CR>
  vmap ,u :s/^=[podcut]\{3}\n//<CR>
endfunction

function! s:commap_ruby() abort
  vmap ,, :s/\%V\(^\_.*$\)\%V/=begin\r\1\r=end/<CR>:nohlsearch<CR>
  vmap ,u :s/^=[begind]\{3}\n//<CR>
endfunction

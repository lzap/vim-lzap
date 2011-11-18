augroup markdown
  autocmd BufRead *.markdown,*.mkd ru macros/textprocessor.vim
  autocmd BufRead *.markdown,*.mkd set ai formatoptions=tcroqn2 comments=n:>
augroup END

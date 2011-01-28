function! Titoem()
    " delete e-mails in form (xxx@xxxx)
    %s/\s*([a-zA-Z0_9._%+-]\+@[a-zA-Z0-9.-]\+\.[\a-zA-Z0-9]\{2,4})\s*//g
    " delete all empty lines
    %s/^\n\+//
endfunction

map <F5> :call Titoem()<CR>

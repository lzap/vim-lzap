if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1 " Don't load twice in one buffer

setlocal spell
call setpos('.', [0, 1, 1, 0])
set fo+=a
set textwidth=76

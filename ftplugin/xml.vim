if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1 " Don't load twice in one buffer

map <F5> <Esc>:1,$!xmllint --format -<CR>

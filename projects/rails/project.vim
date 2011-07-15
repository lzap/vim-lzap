" Command Exec trick by lzap _at_ seznam _dot_cz
"
" Add this to your .vimrc:
" 
" map <F12> :source project.vim<CR>
"
" Then copy this file to your project directory with the same name.
" Edit the commands in the file (...CommandE(..., 'command goes here')<CR>)
" Open the vim editor in the same directory and hit F12.
" Keys are mapped now. Each window is killed first when you execute it.
" I recommend to tune your window manager setting - OpenBox is opening
" my xterm windows with XTermVim* classes on a different screen without 
" any focus and in the positions I like.
"

function! CommandE(tag, cmd)
  call system('pkill -f ' . a:tag . '&')
  call system('xterm -class ' . a:tag . ' -e "bash -c \"cd src/ && ' . a:cmd . '; read -p ENTER\"" &')
  redraw
  echo 'Command Exec:' a:cmd
endfunction

map <F5> :wa\|call CommandE('XTermVimF5', 'rails server')<CR>
map <F6> :wa\|call CommandE('XTermVimF6', 'rails console')<CR>
map <F7> :wa\|call CommandE('XTermVimF7', 'rake spec --trace')<CR>
map <F8> :wa\|call CommandE('XTermVimF8', '')<CR>
map <F9> :wa\|call CommandE('XTermVimF9', '')<CR>
map <F10> :wa\|call CommandE('XTermVimF10', 'rake spec SPEC=' . bufname('%'))<CR>
map <F11> :wa\|call CommandE('XTermVimF11', '')<CR>
map <F12> :source project.vim<CR>

echo 'CommandE: Project loaded...'

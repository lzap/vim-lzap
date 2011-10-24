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

function! CommandE(tab, cmd)
  call system('videx "' . a:tab . '" ' . getcwd() . ' "' . a:cmd . '"')
  redraw
  echo 'Command Exec:' a:cmd
endfunction

map <F5> :wa\|call CommandE('server', 'cd src && rails server')<CR>
map <F6> :wa\|call CommandE('console', 'cd src && rails console')<CR>
map <F7> :wa\|call CommandE('rspec suite', 'cd src && rake kill_pg_connections spec')<CR>
map <F8> :wa\|call CommandE('cli suite', 'scripts/test/katello-cli-simple-test.sh')<CR>
map <F9> :wa\|call CommandE('server jobs', 'cd src && for (( ;; )); do rake jobs:work --trace; done')<CR>
map <F10> :wa\|call CommandE('rspec test', 'cd src && rake kill_pg_connections spec SPEC=../' . bufname('%'))<CR>
map <F11> :wa\|call CommandE('rspec suite', 'cd src && time rake kill_pg_connections spec --trace')<CR>
map <F12> :source project.vim<CR>

echo 'CommandE: Project loaded...'

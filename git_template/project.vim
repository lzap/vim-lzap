" Vim ultra-simple project support
"
" Add this (or something similar) to your .vimrc:
" 
" map <F12> :source .git/project.vim<CR>
"
" This template uses remote terminal Vide for executing builds/servers from
" my editor. https://github.com/lzap/vide

function! VideLast()
  call system('videx-last')
  redraw
  echo 'Command reexec'
endfunction

function! Vide(tab, cmd)
  call system('videx "' . a:tab . '" ' . getcwd() . ' "' . a:cmd . '"')
  redraw
  echo 'Command Exec:' a:cmd
endfunction

"map <F5> :wa\|call Vide('command f5', 'echo NOT USED YET')<CR>
"map <F6> :wa\|call Vide('command f6', 'echo NOT USED YET')<CR>
"map <F7> :wa\|call Vide('command f7', 'echo NOT USED YET')<CR>
"map <F8> :wa\|call Vide('command f8', 'echo NOT USED YET')<CR>

"map <F9> :wa\|call Vide('command f9', 'echo NOT USED YET')<CR>
"map <F10> :wa\|call Vide('command f10', 'echo NOT USED YET')<CR>
"map <F11> :wa\|call Vide('command f11', 'echo NOT USED YET')<CR>
"map <F12> :wa\|call Vide('command f12', 'echo NOT USED YET')<CR>

echo 'Vide: Project loaded...'

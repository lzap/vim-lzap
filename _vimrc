" LOAD BASIC SETTING
source $HOME/.vim/_vimrc_basic

" FIX FOR cp1250 and English Windows XP isalpha() problem
if has("win32")
	set iskeyword=@,48-57,_,138,140-143,154,156-159,163,165,170,175,179,185,186,188,190-214,216-246,248-254
endif

" COMPLETE PATH (do not set recursive - slow!)
"set path=$PWD

if has("gui_running")
	set title
	set titlestring=VI\ -\ %t
  set mousehide

  map <S-Insert> <MiddleMouse>
  map! <S-Insert> <MiddleMouse>
else
	set notitle
endif

" SPELLING
if version >= 700
	set spelllang=cs,en
endif

" AMERICAN TWO SPACES
set nojoinspaces

" CZECH IN NORMAL MODE (czech keyboard emulation if something goes bad)
"set langmap=ì2,¹3,è4,ø5,¾6,ý7,á8,í9,é0,\":,-/,_?

" BEHAVE
behave xterm

" CZECH KEYBOARD SHORTCUTS
imap ;; '

" TABS (I dont like gt and gT)
map tk :tabnext<CR>
map tj :tabprev<CR>
map th :tabfirst<CR>
map tl :tablast<CR>
map tc :tabclose<CR>
map tm :tabm<Space>
map to :tabnext<Space>
map tn :tabnew<CR>
map tf :tabnew<CR>:find<Space>

" NERDTree plugin
nmap <leader>n :NERDTreeToggle<CR>
" CtrlP plugin
nmap <leader>, :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>t :CtrlPTag<CR>
" Tagbar plugin
nmap <leader>r :NERDTree<CR>
" tags (CTRL-] is very hard to do on Czech keylayout)
map <C-K> <C-]>
map <S-K> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nmap <leader>a :silent !$HOME/.vim/ctags_update.sh<CR>
" menu and toolbar toggling
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
" omnisense on control+space
imap <C-SPACE> <C-X><C-O>
" tablabel
set guitablabel=%{substitute(expand('%:p'),'/\\zs\\(.\\)[^/]*\\ze/','\\1','g')}
" change working dir binds
nmap <leader>gkk :cd ~/CloudForms/katello/src<CR>
nmap <leader>gk :cd ~/CloudForms/katello<CR>

" functional keys
map <F5> :wa<CR>:make<CR>:cw<CR>
map <F6> :cw<CR>
map <F7> :cprevious<CR>
map <F8> :cnext<CR>

map <F9> :source .git/project.vim<CR>
map <F10> :source .git/project.vim<CR>
map <F11> :source .git/project.vim<CR>
map <F12> :source .git/project.vim<CR>

" trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>p :set nolist!<CR>
let c_space_errors=1
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" GUI (menu and toolbar hidden - toggle with CTRL+F1 to F3)
set display=lastline
set guioptions+=a
set guioptions-=T
set guioptions-=m

" disable tearoff menus
let &guioptions = substitute(&guioptions, "t", "", "g")

" fonts etc.
if has("win32")
	au GUIEnter * simalt ~x
	"set guifont=Lucida_Console:h10:cEASTEUROPE
	set guifont=Terminus_Re33:h14:cEASTEUROPE
endif

if has("x11")
  if &diff
	  "au GUIEnter * winsize 999 99
  else
	  "au GUIEnter * winsize 120 35
  endif
	"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
	"set guifont=-misc-fixed-medium-r-normal--15-*-iso8859-2
	"set guifont=Console\ 10
  if &diff
	  set guifont=Terminus\ 8
  else
	  set guifont=Terminus\ 14
  endif
endif

" cursorline enables the highlighting of the line with cursor
" but also SLOWS DOWN sytax highligting on long lines
if has("gui_running")
	set nocursorline
endif

" FILETYPE DETECTION
if has("autocmd")
    " load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
endif

" PATHOGEN PLUGIN (enables .vim/bundle)
call pathogen#runtime_append_all_bundles()

" SYNTASTIC PLUGIN
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_warnings=1
"let g:syntastic_python_checker = 'pyflakes'
let g:syntastic_python_checker = 'pylint'
let g:syntastic_python_checker_args = '--rcfile=/etc/spacewalk-pylint.rc --additional-builtins=_'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" GIST PLUGIN
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL% &'

" CTRLP PLUGIN
let g:ctrlp_max_height = 25
let g:ctrlp_open_multiple_files = '9tj'

" GO LANG PLUGINS
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" COLOR SCHEME (must be positioned after pathogen plugin)
"let moria_style = "black"
"colorscheme moria
colorscheme distinguished
hi clear SpellBad
hi SpellBad cterm=underline


" EOF

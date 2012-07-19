" BASIC SETTING

" other basic settings
set nocompatible
set backspace=2
set history=300
set ruler
set showcmd
set showmode
set wildmenu
set wildignore=*~,*.o,*.log,*.aux,*.dvi,*.tmp
map Q gq
set mousehide
set clipboard=unnamed
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
"set fileencodings=ucs-bom,utf-8,default,iso-8859-2,cp1250,latin1
syntax on

" EDITING (this is programmer`s mode, for text you have to redefine explicitly
" this basic setting, eg. for latex etc)
set formatoptions=toqo
set wrap
set textwidth=0
set linebreak
"set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
" no bracket matching (very slow)
set noshowmatch
let loaded_matchparen = 1
" backspace and cursor keys wrap to previous/next line
set backspace=2 whichwrap+=<,>,[,]
" no messages about changed files
set autoread

" FIX FOR cp1250 and English Windows XP isalpha() problem
if has("win32")
	set iskeyword=@,48-57,_,138,140-143,154,156-159,163,165,170,175,179,185,186,188,190-214,216-246,248-254
endif

" SWAP FILE AND BACKUP DIR
" directory to store in
if has("win32")
	set directory=c:\temp
	set backupdir=c:/temp
else
	set directory=/tmp
	set backupdir=~/.vimbackup
endif
set backup
" save swap after 250 seconds of idle
set updatetime=250000
" or 1000 characters written
set updatecount=1000
" do not flush the swap to disk (working on laptop)
set swapsync=

" MODELINE (vim:xxxx:)
set modeline
set modelines=10

" SEARCHING
set smartcase
set incsearch
set hlsearch
set path=$PWD/**

" STATUS LINE
set laststatus=2
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
"highlight User1 guibg=white guifg=blue
"highlight User2 guibg=white guifg=red
set rulerformat=%3b\ \ %l,%c%V%=%P

if has("gui_running")
	set title
	set titlestring=VI\ -\ %t
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

" MOVEMENT
set scrolloff=5
set sidescroll=5

" SOFT WRAPPING
set showbreak=+
:noremap <Up> g<Up>
:noremap <Down> g<Down>
:inoremap <Up> <Esc>g<Up>a
:inoremap <Down> <Esc>g<Down>a

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

" LEADER 
let mapleader = ","

" CZECH KEYBOARD SHORTCUTS
imap ;; `

" NAVIGATING ERRORS
map <leader>co :copen<CR>
map <leader>cj :cnext<CR>
map <leader>ck :cprevious<CR>
map <leader>cc :cclose<CR>

" BUFFERS
map <leader>j :bnext<CR>
map <leader>k :bprevious<CR>
map <leader>q :b#<CR>

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
nmap <leader>g :silent !$HOME/.vim/ctags_update.sh<CR>
" menu and toolbar toggling
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
" omnisense on control+space
imap <C-SPACE> <C-X><C-O>
" tablabel
set guitablabel=%{substitute(expand('%:p'),'/\\zs\\(.\\)[^/]*\\ze/','\\1','g')}
" session loading and saving
nmap <leader>m :mksession! $HOME/mysession.vim<CR>
nmap <leader>s :so $HOME/mysession.vim<CR>

" functional keys
"nmap <F2> :tabnew<CR>:Explore<CR>
"imap <F2> <C-o><F1>
"command Wmake write | make
"nmap <F5> :Wmake<CR>:cl<CR>
"imap <F5> <C-o><F5>
"nmap <F6> :cclose<CR>
"imap <F6> <C-o><F5>
"nmap <F7> :cprevious<CR>
"imap <F7> <C-o><F5>
"nmap <F8> :cnext<CR>
"imap <F8> <C-o><F5>
map <F5> :source project.vim<CR>
map <F6> :source project.vim<CR>
map <F7> :source project.vim<CR>
map <F8> :source project.vim<CR>
map <F9> :source project.vim<CR>
map <F10> :source project.vim<CR>
map <F11> :source project.vim<CR>
map <F12> :source project.vim<CR>

" trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>p :set nolist!<CR>
let c_space_errors=1
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" folding
if has("folding")
  set foldmethod=manual
  set foldlevel=6
  set nofoldenable
  "nmap <F11> :foldopen<CR>
  "nmap <F12> :foldclose<CR>
  "imap <F11> <ESC>:foldopen<CR>i
  "imap <F12> <ESC>:foldclose<CR>i
endif

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
	"au GUIEnter * winpos 20 20
  if &diff
	  au GUIEnter * winsize 999 99
  else
	  au GUIEnter * winsize 120 35
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

" COLOR SCHEME
let moria_style = "black"
colorscheme moria
"if version >= 700
	"hi CursorLine term=reverse ctermbg=0 guibg=#323232
	"hi SpellBad term=reverse ctermbg=1 gui=underline guifg=Yellow
	"hi SpellLocal term=reverse ctermbg=6 gui=underline guifg=Cyan
	"hi SpellRare term=reverse ctermbg=5 gui=underline guifg=White
	"hi SpellCap term=NONE ctermbg=NONE gui=NONE guifg=fg
"endif
"hi Search guibg=#996666
"hi Visual guibg=#666666 
"
" cursorline enables the highlighting of the line with cursor
" but also SLOWS DOWN sytax highligting on long lines
if has("gui_running")
	set nocursorline
endif

" WILDIGNORE FOR FILE LISTS
" default: *~,*.o,*.log,*.aux,*.dvi,*.tmp,*.pyc
set wildignore+=*.pyc,*.pyo,.git,.svn

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
let g:syntastic_python_checker = 'pyflakes'

" GIST PLUGIN
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL% &'

" EOF

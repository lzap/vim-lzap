" PLUGINS - for more go to https://vimawesome.com
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'lzap/vim-selinux'
call plug#end()

" SPELLING
if version >= 700
  set spelllang=cs,en
endif

" AMERICAN TWO SPACES
set nojoinspaces

" BEHAVE
behave xterm

" custom commands
:command W w
:command Wa wa
:command WA wa
:command Wq wq
:command WQ wq

" GUI must be simple
set display=lastline
set guioptions+=a
set guioptions-=T
set guioptions-=m
let &guioptions = substitute(&guioptions, "t", "", "g")

" fonts etc.
if has("win32")
  au GUIEnter * simalt ~x
  set guifont=Terminus_Re33:h14:cEASTEUROPE
endif

if has("x11")
  set guifont=Terminus\ 14
endif

" cursorline enables the highlighting of the line with cursor
" but also SLOWS DOWN sytax highligting on long lines
"set cursorline

" COLOR SCHEME (must be positioned after pathogen plugin)
set termguicolors
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

hi clear SpellBad
hi SpellBad cterm=underline ctermfg=yellow

" trailing whitespace (MUST be AFTER colorscheme)
set listchars=trail:·,tab:··
let c_space_errors=1
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" GIT COMMIT
au FileType gitcommit set tw=72

" ACK SEARCH INTO QuickFix
let g:ackprg = "ag --vimgrep"

" SYNTASTIC - keep signs column opened forever
"set signcolumn=yes

" TAGS
set tags=.git/tags,./tags,./TAGS,tags,TAGS

" LOAD MY OWN BASIC SETTING - INC. LEADER SHORTCUTS
source $HOME/.vim/_vimrc_basic

" SPLIT TO LINES
function SplitToLines() range
  for lnum in range(a:lastline, a:firstline, -1)
    let words = split(getline(lnum))
    execute lnum . "delete"
    call append(lnum-1, words)
  endfor
endfunction

" EOF


" vim: nowrap sw=2 sts=2 ts=2 et:

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'govim/govim'
"Plugin 'w0rp/ale'
call vundle#end()

" govim plugin: ~/.vim/bundle/govim/cmd/govim/config/minimal.vimrc
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set updatetime=500
set balloondelay=250
set signcolumn=yes
set autoindent
set smartindent
set backspace=2
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" leaders
let mapleader=","
let maplocalleader="_"

" colors
if has('mac')
  if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
    set background=dark
    colorscheme evening
  else
    set background=light
    colorscheme morning
  endif

  " some defaults on MacOS are overriden
  set modeline
  set modelines=5
  syntax on
else
  set background=dark
  colorscheme solarized
endif

" GUI fonts
if has("gui_macvim")
  set guifont=Monaco:h16
endif

" filetype and intent (also required by vundle)
filetype plugin indent on

" optional plugins coming with Vim
if has('syntax') && has('eval')
  packadd! matchit
end

" do not mess my working directories
set backupdir=~/.vimbackup

" fuzzy searching
nnoremap <leader><leader> :FZF<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>
nnoremap <leader>T :BTags<cr>
nnoremap <leader>c :Commits<cr>
nnoremap <leader>h :History<cr>

" buffers and quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <leader>q :call ToggleQuickFix()<cr>
nnoremap <leader>d :bd<cr>

" make
nnoremap <leader>m :make<cr>

" searching ang grepping
nnoremap <leader>r :Rg<SPACE>
nnoremap <leader>g :copen<cr>:Ggrep!<SPACE>
nnoremap K :Ggrep "\b<C-R><C-W>\b"<cr>:cw<cr>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>

" ctags generation
nnoremap <leader>c :!ctags -R .<cr><cr>

" per-project configs
set exrc
set secure

" --- CUT HERE ---
" The rest are very much personal settings which are specific
" to my needs or keyboard layout. You unlikely need those.

" be SSD friendly (use with care!)
set directory=/tmp

" fine-tune MRU and cache settings of CtrlP
let g:ctrlp_cache_dir = '/tmp/ctrlp-cache'
let g:ctrlp_mruf_save_on_update = 0

" CTRL-] is hard on my keyboard layout
map <C-K> <C-]>

" CTRL-^ is hard on my keyboard layout
nnoremap <F1> :b#<cr>
nnoremap <F2> :bp<cr>
nnoremap <F3> :bn<cr>

" I hate entering Ex mode by accient
map Q <Nop>

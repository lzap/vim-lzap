" vim: nowrap sw=2 sts=2 ts=2 et:
" leaders
let mapleader=","
let maplocalleader="_"

" filetype and intent
filetype plugin indent on

" optional plugins coming with Vim
if has('syntax') && has('eval')
  packadd! matchit
end

" do not mess my working directories
set backupdir=~/.vimbackup

" fuzzy searching
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
nnoremap <leader><leader> :FZF<cr>
" Uncmment if you prefer CtrlP file searching instead of FZF
"let g:ctrlp_map = '<leader><leader>'
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>f :CtrlPBufTag<cr>
nnoremap <leader>q :CtrlPQuickfix<cr>
nnoremap <leader>m :CtrlPMRU<cr>

" buffers and quickfix
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
  else
    cclose
  endif
endfunction
nnoremap <leader>w :call ToggleQuickFix()<cr>
nnoremap <leader>d :bd<cr>

" searching ang grepping
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

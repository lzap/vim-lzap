" vim: nowrap sw=2 sts=2 ts=2 et:

" leaders
let mapleader=","
let maplocalleader="_"

" filetype and intent
filetype plugin indent on

" incompatible plugins
if has('syntax') && has('eval')
	packadd! matchit
end

" be SSD friendly
"set directory=/tmp

" move backups away from projects
set backupdir=~/.vimbackup

" fuzzy searching
let g:ctrlp_map = '<leader><leader>'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
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
nnoremap <leader>g :copen<cr>:Ggrep! <SPACE>
nnoremap K :Ggrep "\b<C-R><C-W>\b"<cr>:cw<cr>
nnoremap <leader>s :set hlsearch! hlsearch?<cr>

" ctags generation
nnoremap <leader>c :!ctags -R .<cr><cr>

" per-project configs
set exrc
set secure

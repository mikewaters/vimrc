" unsure why this was here
" filetype off

" Notes:
" - reload config:
"   :source ~/.vimrc
"
" TODO:
" - document this file
" - move gvim-specific diretove to .gvimrc

set nocompatible
execute pathogen#infect()
execute pathogen#helptags()

set background=dark
set encoding=utf-8

set nobackup
set nowritebackup
set noswapfile
" set paste
set laststatus=2
set t_Co=256


set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab
set smarttab

set visualbell

set undofile
set undodir=~/.vim/undodir

syntax enable

filetype plugin indent on

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11

" bash-like filename completion
set wildmode=longest,list,full
set wildmenu

" delete key behavior in osx
set backspace=indent,eol,start

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END


" autoreload when vimrc changes
" this conflicts with vim-airline, loses buffer highlighting.
" augroup myvimrc
"     au!
"     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
" augroup END

" close window if nerdtree is the only buffer
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" disable left-hand scrollbar in macvim (nerdtree issue)
set guioptions-=L



" start nerdtree if vim is opened with no files specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" remap <leader>nn to NERDTree, opening in the cwd for whatever file is open

" don't set cwd to open file's dir
set noautochdir
let NERDTreeChDirMode=0

" show bookmarks automatically
let NERDTreeShowBookmarks=1

"
" keymaps
"
" open nerd in cwd
nnoremap <leader>nt :NERDTree .<CR>

" toggle set number
nnoremap <leader>sn :set number!<CR>

" close the current buffer but don't close the window
nnoremap <leader>bb :bp<bar>sp<bar>bn<bar>bd<CR>

" insert ipdb brkpt
nnoremap <leader>pdb oimport ipdb; ipdb.set_trace()


" vim-airline
let g:airline_powerline_fonts = 1

 " vim-airline-tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


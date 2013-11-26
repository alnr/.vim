" For new machines:
" 1) mkdir -p ~/.vim/bundle && git clone git@github.com:alnr/.vim.git ~/.vim
" 2) ln -s ~/.vim/vimrc ~/.vimrc
" 3) git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 4) in vim type EX command :BundleInstall
"
" Vundle necessaries
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-commentary'
Bundle 'vim-jp/cpp-vim'
Bundle 'TyeMcQueen/vim-merge-windows'
source ~/.vim/bundle/vim-merge-windows/patience-diff.vim

" Configuration
if $TERM == "xterm-256color" || $TERM == "screen-256color"
  set t_Co=256
endif

set bg=dark
set laststatus=2

" Remember last position in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

syntax on
filetype plugin indent on
set incsearch
set ignorecase
set smartcase
set hlsearch
set nowrapscan
set noautoindent
set smartindent
filetype indent off
set expandtab
set shiftwidth=4
set softtabstop=4
set so=7
set wildignore+=*.o,*.a,*.so,*.swp,*.zip
set matchpairs=(:),{:},[:],<:>
" set textwidth=80
" set colorcolumn=+1

" Some much-needed bugfixes
" Fix backspace
set backspace=indent,eol,start
" Make Y act like the other capital letters
nnoremap Y y$
" Play back macro in q with Q
nnoremap Q @q
" Disable search highlighting
nmap \q :nohlsearch<CR>
" Toggle line numbers
nmap \l :setlocal number!<CR>
" Toggle paste mode
nmap \p :set paste!<CR>
" Reselect visual selection after < and >
vmap > >gv
vmap < <gv
" Swap buffers
nmap <C-m> :e#<CR>
" Next buffer
nmap <C-n> :bnext<CR>
" previous buffer
nmap <C-b> :bprev<CR>

nmap , :CtrlPBuffer<CR>
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

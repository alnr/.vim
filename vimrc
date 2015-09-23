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
Bundle 'scrooloose/syntastic'
Bundle 'TyeMcQueen/vim-merge-windows'
Bundle 'majutsushi/tagbar'
source ~/.vim/bundle/vim-merge-windows/patience-diff.vim


" Syntastic C++11
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

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
set nowrap
set noincsearch
set ignorecase
set smartcase
set fdo-=search " don't open folds when searching
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

nnoremap <silent> <F9> :TagbarToggle<CR>

" update current tag highlight in tagbar more rapidly
set updatetime=100    " default is 4000

" list local variables in tagbar
" let g:tagbar_type_cpp = {
"     \ 'kinds' : [
"         \ 'd:macros:1',
"         \ 'g:enums',
"         \ 't:typedefs:0:0',
"         \ 'e:enumerators:0:0',
"         \ 'n:namespaces',
"         \ 'c:classes',
"         \ 's:structs',
"         \ 'u:unions',
"         \ 'f:functions',
"         \ 'm:members:0:0',
"         \ 'v:global:0:0',
"         \ 'x:external:0:0',
"         \ 'l:local:0:0'
"     \ ]
" \ }

" Toggle cursor line highlighting
hi CursorLine   cterm=NONE ctermbg=lightblue ctermfg=white guibg=lightblue guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! <CR>

" switch panes with CTRL+{HJKL}
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" mapping to make movements operate on 1 screen line in wrap mode
" from http://stackoverflow.com/questions/4946421/vim-moving-with-hjkl-in-long-lines-screen-lines
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")


" \w toggles tailing whitespace highlighting
:highlight RED ctermbg=red guibg=red
nnoremap \w :call FindExtraWhitespaceToggle()<CR>
let g:ExtraWhiteSpaceMatch = 0
function! FindExtraWhitespaceToggle()
    if g:ExtraWhiteSpaceMatch
        let g:ExtraWhiteSpaceMatch = 0
        :match
    else
        let g:ExtraWhiteSpaceMatch = 1
        :match RED /\s\+$/
    endif
endfunction
